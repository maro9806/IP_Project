from flask.cli import load_dotenv
from langchain.chains import RetrievalQA
from langchain_openai import ChatOpenAI
from langchain_pinecone import PineconeVectorStore
from langchain_openai import OpenAIEmbeddings
from dotenv import load_dotenv
from flask import Flask, request, jsonify
import os
import requests
from flask_cors import CORS

load_dotenv()
openai_api_key = os.getenv('OPENAI_API_KEY')

app = Flask(__name__)
CORS(app)

SPRING_BOOT_URL = "http://localhost:8081/api/interviews/saveFromFlask"

@app.route('/aiboard/ai_custominfo', methods=['POST'])
def ai_custominfo():
    data = request.json
    user_introduction = data.get('introduction')
    company_name = data.get('company')
    job_position = data.get('jobSelect')

    # 면접 및 인성 질문 생성
    interview_questions = get_interview_questions(company_name, job_position)
    personality_questions = get_personality_questions(user_introduction)

    # 질문을 합친 후 Spring Boot로 전송
    all_questions = interview_questions + personality_questions
    send_to_spring_boot(all_questions)

    return jsonify({'message': 'Questions generated and sent to Spring Boot.'})

def send_to_spring_boot(questions):
    payload = {
        "Q1": questions[0], "Q2": questions[1], "Q3": questions[2],
        "Q4": questions[3], "Q5": questions[4], "Q6": questions[5]
    }

    try:
        response = requests.post(SPRING_BOOT_URL, json=payload)
        response.raise_for_status()  # 응답 상태 코드가 200이 아닐 경우 예외 발생
        print("데이터가 성공적으로 저장되었습니다.")
    except requests.exceptions.RequestException as e:
        print(f"저장 실패: {e}")


# 직무 관련 면접 질문 추출
def get_interview_questions(company_name, job_position):
    embedding = OpenAIEmbeddings(model='text-embedding-3-large', openai_api_key=openai_api_key)
    index_name = 'project'
    database = PineconeVectorStore.from_existing_index(embedding=embedding, index_name=index_name)

    llm = ChatOpenAI(model='gpt-4o', openai_api_key=openai_api_key)
    retriever = database.as_retriever(search_kwargs={'k': 4})

    # 쿼리 생성
    query = f"{company_name}의 {job_position} 직무 면접에서 물어볼 수 있는 직무 관련 질문 4개를 작성해주세요. 설명이나 부가적인 문구 없이 질문만 작성해주세요."

    # QA 체인 설정
    qa_chain = RetrievalQA.from_chain_type(
        llm,
        retriever=retriever,
        chain_type="stuff",
    )

    # 질문 생성
    ai_message = qa_chain({"query": query})

    # 결과 반환: 질문들을 리스트로 변환하여 반환
    if ai_message and 'result' in ai_message:
        questions_list = ai_message['result'].strip().split('\n')  # 질문을 줄바꿈으로 나누기
        return questions_list[:3]  # 3개만 반환
    else:
        return ["검색 결과가 없습니다."]

# 인성 관련 질문 추출
def get_personality_questions(user_introduction):
    embedding = OpenAIEmbeddings(model='text-embedding-3-large', openai_api_key=openai_api_key)
    index_name = 'personal'
    database = PineconeVectorStore.from_existing_index(embedding=embedding, index_name=index_name)

    llm = ChatOpenAI(model='gpt-4o', openai_api_key=openai_api_key)
    retriever = database.as_retriever(search_kwargs={'k': 4})

    # 쿼리 생성
    query = f"다음 자기소개서 내용을 바탕으로 물어볼 수 있는 인성 면접 질문 4개를 작성해주세요. 설명이나 부가적인 문구 없이 질문만 작성해주세요: {user_introduction}"

    # QA 체인 설정
    qa_chain = RetrievalQA.from_chain_type(
        llm,
        retriever=retriever,
        chain_type="stuff",
    )

    # 질문 생성
    ai_message = qa_chain({"query": query})

    # 결과 반환: 질문들을 리스트로 변환하여 반환
    if ai_message and 'result' in ai_message:
        questions_list = ai_message['result'].strip().split('\n')  # 질문을 줄바꿈으로 나누기
        return questions_list[:3]  # 3개만 반환
    else:
        return ["검색 결과가 없습니다."]

if __name__ == '__main__':
    app.run(debug=True)
