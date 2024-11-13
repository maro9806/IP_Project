# pjfunction.py
from langchain.chains import RetrievalQA
from langchain_openai import ChatOpenAI
from langchain_pinecone import PineconeVectorStore
from langchain_openai import OpenAIEmbeddings
from langchain import hub

def get_llm(model='gpt-3.5-turbo'):
    llm = ChatOpenAI()
    return llm

def get_retriever(index_name):
    embedding = OpenAIEmbeddings(model='text-embedding-3-large')
    database = PineconeVectorStore.from_existing_index(embedding=embedding, index_name=index_name)
    retriever = database.as_retriever(search_kwargs={'k': 4})
    return retriever

def get_qa_chain(retriever):
    llm = get_llm()
    qa_chain = RetrievalQA.from_chain_type(
        llm,
        retriever=retriever,
        chain_type="stuff",
    )
    return qa_chain

def generate_ai_message(qa_chain, query):
    ai_message = qa_chain.invoke({"query": query})
    if ai_message and 'result' in ai_message:
        return ai_message['result']
    else:
        return ["검색 결과가 없습니다."]

def get_interview_questions(company_name, job_position):
    retriever = get_retriever('project')
    qa_chain = get_qa_chain(retriever)

    query = f"""{company_name}의 {job_position} 직무 면접에서 물어볼 수 있는 직무 관련 질문 3개를 작성해주세요. 설명이나 부가적인 문구 없이 질문만 작성해주세요.
    또한 면접질문을 기반으로 직무 관련 질문을 생성할 때는 Question(Q)을 참고하여 직무 관련 질문을 생성해주세요."""

    return generate_ai_message(qa_chain, query)

def get_personality_questions(user_introduction):
    retriever = get_retriever('personal')
    qa_chain = get_qa_chain(retriever)

    query = f"다음 자기소개서 내용을 바탕으로 물어볼 수 있는 인성 면접 질문 3개를 작성해주세요. 설명이나 부가적인 문구 없이 질문만 작성해주세요: {user_introduction}"

    return generate_ai_message(qa_chain, query)

def get_answer_feedback(question, answer, job_position=None, ipro_type=None):
    llm = get_llm()

    if ipro_type == 'position':
        prompt = f"""다음은 {job_position} 직무 면접 질문과 답변입니다:

질문: {question}
답변: {answer}

이 답변에 대한 전문적인 피드백을 제공해주세요. 다음 사항을 고려해주세요:
1. 직무 전문성이 잘 드러났는지
2. 구체적인 경험이나 지식이 잘 표현되었는지
3. 부족하거나 보완이 필요한 부분
4. **잘못된 정보가 있을 때만 해당 내용을 지적하고 올바른 정보를 제공할 것 (잘못된 정보가 없으면 이 섹션을 생략)** 
5. 개선을 위한 구체적인 제안

답변 형식:
[장점]
- 만약 답변이 대충 작성되었거나 장점이 없을 경우, 이 섹션을 **절대로 출력하지 마세요**.
- 만약 장점이 있다면 간단히 나열하세요.
- 단, 답변이 전문성이나 성의가 전혀 없는 경우 장점을 **결코** 생성하지 마세요.

[개선점]
- 답변이 반말로 작성된 경우, "반말 사용은 피해야 합니다."라고 언급하세요.
- 보완이 필요한 부분들을 나열하세요.
- **잘못된 지식이 있는 경우에만 이를 지적하고 수정된 정보를 제공하세요.**

[구체적인 제안]
- 개선을 위한 실질적인 조언을 제공하세요.
- **잘못된 정보가 없는 경우 이 섹션에서 불필요한 언급은 생략하세요.**
"""
    else:
        prompt = f"""다음은 인성 면접 질문과 답변입니다:

질문: {question}
답변: {answer}

이 답변에 대한 피드백을 제공해주세요. 다음 사항을 고려해주세요:
1. 질문의 의도를 잘 파악했는지
2. 구체적인 경험이나 사례가 잘 표현되었는지
3. 답변의 논리성과 설득력
4. 개선이 필요한 부분
5. **잘못된 정보가 있을 때만 해당 내용을 지적하고 올바른 정보를 제공할 것 (잘못된 정보가 없으면 이 섹션을 생략)**

답변 형식:
[장점]
- 만약 답변이 대충 작성되었거나 장점이 없을 경우, 이 섹션을 **절대로 출력하지 마세요**.
- 만약 장점이 있다면 간단히 나열하세요.
- 단, 답변이 전문성이나 성의가 전혀 없는 경우 장점을 **결코** 생성하지 마세요.

[개선점]
- 답변이 반말로 작성된 경우, "반말 사용은 피해야 합니다."라고 언급하세요.
- 보완이 필요한 부분들을 나열하세요.
- **잘못된 지식이 있는 경우에만 이를 지적하고 수정된 정보를 제공하세요.**

[구체적인 제안]
- 개선을 위한 실질적인 조언을 제공하세요.
- 올바른 답변으로 수정하세요.
- **잘못된 정보가 없는 경우 이 섹션에서 불필요한 언급은 생략하세요.**

"""

    response = llm.invoke(prompt)

    return response.content





