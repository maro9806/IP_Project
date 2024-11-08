import os
from dotenv import load_dotenv
import oracledb

def get_db_connection():
    """Oracle DB 연결 설정"""
    # .env 파일 로드
    load_dotenv()


    oracledb.init_oracle_client()

    dsn = oracledb.makedsn(
        host='project-db-stu3.smhrd.com',
        port=1524,
        service_name='xe'
    )

    connection = oracledb.connect(
        user=os.getenv('DB_USER'),
        password=os.getenv('DB_PASSWORD'),
        dsn=os.getenv('DB_DSN', dsn)  # DSN이 환경변수에 없으면 기본값 사용
    )
    return connection

def get_company_position_info(self_idx):
    """회사명과 직무 정보 가져오기"""
    connection = get_db_connection()
    cursor = connection.cursor()

    try:
        query = """
        SELECT SELF_COMPANY, SELF_POSITION 
        FROM SELF_BOARD 
        WHERE SELF_IDX = :self_idx
        """
        cursor.execute(query, self_idx=self_idx)
        result = cursor.fetchone()

        if result:
            print(f"Found company info: {result}")  # 디버깅용 출력
        else:
            print(f"No company info found for self_idx: {self_idx}")  # 디버깅용 출력

        return result if result else (None, None)

    except Exception as e:
        print(f"Error getting company info: {str(e)}")  # 디버깅용 출력
        raise

    finally:
        cursor.close()
        connection.close()

def get_self_introduction_data(self_idx):
    """특정 자기소개서의 모든 문항을 가져와서 하나의 문자열로 결합"""
    connection = get_db_connection()
    cursor = connection.cursor()

    try:
        query = """
        SELECT INTRO_QUESTION, INTRO_ANSWER 
        FROM SELF_INTRODUCTION 
        WHERE SELF_IDX = :self_idx
        ORDER BY INTRO_IDX
        """
        cursor.execute(query, self_idx=self_idx)
        rows = cursor.fetchall()

        combined_text = "\n\n".join([f"Q: {row[0]}\nA: {row[1]}" for row in rows])
        return combined_text

    finally:
        cursor.close()
        connection.close()

def save_interview_questions(self_idx, questions):
    """면접 질문을 데이터베이스에 저장"""
    connection = get_db_connection()
    cursor = connection.cursor()

    try:
        # 동일한 자소서에 대한 가장 큰 ipro_idx 값 찾기
        cursor.execute("""
            SELECT NVL(MAX(IPRO_IDX), 0)
            FROM INTERVIEW_PRO
        """)

        max_ipro_idx = cursor.fetchone()[0]

        # 각 질문을 데이터베이스에 저장
        first_idx = max_ipro_idx + 1
        for i, question in enumerate(questions, 0):
            current_idx = first_idx + i
            print(f"Trying to insert question {i+1} with IPRO_IDX {current_idx}: {question[:50]}...")  # 디버깅용
            cursor.execute("""
                INSERT INTO INTERVIEW_PRO (
                    IPRO_IDX,
                    IPRO_QUESTION,
                    SELF_IDX
                ) VALUES (
                    :ipro_idx,
                    :question,
                    :self_idx
                )
            """, {
                'ipro_idx': current_idx,
                'question': question,
                'self_idx': self_idx
            })
            print(f"Successfully inserted question {i+1}")  # 디버깅용

        connection.commit()
        print(f"All questions saved with IPRO_IDX range: {first_idx} to {current_idx}")  # 디버깅용
        return first_idx

    except Exception as e:
        print(f"Error saving questions: {str(e)}")
        connection.rollback()
        raise

    finally:
        cursor.close()
        connection.close()

def generate_interview_questions(self_idx):
    """자기소개서 기반으로 면접 질문 생성 및 저장"""
    # 회사명과 직무 정보 가져오기
    company_name, job_position = get_company_position_info(self_idx)
    if not company_name or not job_position:
        print("Error: Company or position information not found")
        return None

    # 자기소개서 내용 가져오기
    introduction_text = get_self_introduction_data(self_idx)
    if not introduction_text:
        print("Error: Self introduction data not found")
        return None

    # 직무 관련 질문 생성
    job_questions = get_interview_questions(company_name, job_position)
    # 개행을 기준으로 질문 분리
    if isinstance(job_questions, str):
        job_questions = [q.strip() for q in job_questions.split('\n') if q.strip()]
    print("\n=== 직무 관련 질문 ===")
    print(job_questions)

    # 인성 관련 질문 생성
    personality_questions = get_personality_questions(introduction_text)
    # 개행을 기준으로 질문 분리
    if isinstance(personality_questions, str):
        personality_questions = [q.strip() for q in personality_questions.split('\n') if q.strip()]
    print("\n=== 인성 관련 질문 ===")
    print(personality_questions)

    # 모든 질문 합치기
    all_questions = job_questions + personality_questions

    # 질문을 데이터베이스에 저장
    ipro_idx = save_interview_questions(self_idx, all_questions)

    return ipro_idx, all_questions

def save_interview_questions(self_idx, questions):
    """면접 질문을 데이터베이스에 저장"""
    connection = get_db_connection()
    cursor = connection.cursor()

    try:
        # 동일한 자소서에 대한 가장 큰 ipro_idx 값 찾기
        cursor.execute("""
            SELECT NVL(MAX(IPRO_IDX), 0)
            FROM INTERVIEW_PRO
        """)

        max_ipro_idx = cursor.fetchone()[0]

        # 각 질문을 데이터베이스에 저장
        first_idx = max_ipro_idx + 1
        for i, question in enumerate(questions):
            if not question.strip():  # 빈 문자열이나 공백만 있는 경우 건너뛰기
                continue

            current_idx = first_idx + i
            print(f"\nTrying to insert question {i+1} with IPRO_IDX {current_idx}")
            print(f"Question: {question}")  # 전체 질문 내용 출력

            cursor.execute("""
                INSERT INTO INTERVIEW_PRO (
                    IPRO_IDX,
                    IPRO_QUESTION,
                    SELF_IDX
                ) VALUES (
                    :ipro_idx,
                    :question,
                    :self_idx
                )
            """, {
                'ipro_idx': current_idx,
                'question': question,
                'self_idx': self_idx
            })
            print(f"Successfully inserted question {i+1}")

        connection.commit()
        print(f"\nAll questions saved with IPRO_IDX range: {first_idx} to {current_idx}")
        return first_idx

    except Exception as e:
        print(f"Error saving questions: {str(e)}")
        connection.rollback()
        raise

    finally:
        cursor.close()
        connection.close()

import sys
import time

def main():
    while True:
        try:
            # stdin에서 self_idx 읽기
            self_idx = sys.stdin.readline().strip()
            if self_idx:
                print(f"Processing self_idx: {self_idx}")
                result = generate_interview_questions(int(self_idx))
                if result:
                    ipro_idx, questions = result
                    print(f"Successfully generated questions for {self_idx}")
                sys.stdout.flush()
        except Exception as e:
            print(f"Error: {str(e)}")
            sys.stdout.flush()
        time.sleep(0.1)

if __name__ == "__main__":
    main()