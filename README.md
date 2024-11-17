## 📎 프로젝트: IPro
![image](https://github.com/user-attachments/assets/5c12b00f-8d46-400d-871f-eb9516e8fd36)

### 👀 서비스 소개
**서비스명:** IPro
**설명:** LLM기반 기업과 나를 잇는 면접 AI코칭 서비스 'IPRO'

### 📅 프로젝트 기간
**기간:** 2024년 10월 15일 ~ 2024년 11월 22일 (5주)

### ⭐ 주요 기능
- 예상 면접 질문 추출
- 질문 답변에 대한 피드백 제공
- 온라인 면접 서비스
- 기업 분석 및 최신 동향
- 리뷰 게시판

### ⛏ 기술 스택
| 구분          | 내용 |
|---------------|---------|
| 기본 사용언어     | <img src="https://img.shields.io/badge/Java-007396?style=for-the-badge&logo=java&logoColor=white"/> <img src="https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=Python&logoColor=white"/> |
| Frontend 사용언어     |  <img src="https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=HTML5&logoColor=white"/> <img src="https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=CSS3&logoColor=white"/> <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=JavaScript&logoColor=white"/> |
|  Backend 프레임워크     |  <img src="https://img.shields.io/badge/Spring boot-D22128?style=for-the-badge&logo=Spring boot&logoColor=white"/> |
| 라이브러리     | <img src="https://img.shields.io/badge/BootStrap-7952B3?style=for-the-badge&logo=BootStrap&logoColor=white"/> <img src="https://img.shields.io/badge/NewsAPI-%23FF9900.svg?style=for-the-badge&logo=NewsAPI&logoColor=white" > <img src="https://img.shields.io/badge/ChatGPT-FF61F6?style=for-the-badge&logo=ChatGPT&logoColor=white"/> <img src="https://img.shields.io/badge/langchain-31A8FF?style=for-the-badge&logo=langchain&logoColor=white"/> <img src="https://img.shields.io/badge/Otuth2-007CE2?style=for-the-badge&logo=Otuth2&logoColor=white"/>|
| 개발 도구     | <img src="https://img.shields.io/badge/Figma-F24E1E?style=for-the-badge&logo=Figma&logoColor=white"/> <img src="https://img.shields.io/badge/Intellij-2C2255?style=for-the-badge&logo=Intellij&logoColor=white"/> <img src="https://img.shields.io/badge/VSCode-007ACC?style=for-the-badge&logo=VisualStudioCode&logoColor=white"/> |
| 서버 환경     | <img src="https://img.shields.io/badge/FastAPI-000000?style=for-the-badge&logo=FastAPI&logoColor=white"/>  |
| 데이터베이스   | <img src="https://img.shields.io/badge/Oracle-F80000?style=for-the-badge&logo=Oracle&logoColor=white"/> <img src="https://img.shields.io/badge/Pinecone-F80000?style=for-the-badge&logo=Pinecone&logoColor=white"/>|
| 협업 도구     | <img src="https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=Git&logoColor=white"/> <img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=GitHub&logoColor=white"/> |
| 인프라 구조     |  <img src="https://img.shields.io/badge/Google Cloud-569A31?style=for-the-badge&logo=Google-Cloud&logoColor=white">|

### ⚙ 시스템 아키텍처


### 📌 SW 유스케이스


### 📌 서비스 흐름도


### 📌 ER 다이어그램



### 🖥 화면 구성


### 🤾‍♂️ 트러블슈팅

## 1. 다중 Flask 사용으로 인한 메모리 과다 사용
---

## 해결방안

1. FastAPI 서버 사용

라이브니스 감지는 얼굴 인식 시스템이 실제로 살아있는 사람을 인식하고 있는지 확인하는 기술입니다. <p>
눈 깜박임 감지: 사용자가 눈을 깜박이는지 확인합니다. <p>
머리 움직임 감지: 사용자가 요청에 따라 머리를 좌우 또는 상하로 움직이는지 확인합니다. <p>
표정 변화 감지: 사용자가 특정 표정을 지을 수 있는지 확인합니다 (예: 미소, 찡그림). <p>


---

2. 다중 요인 인증 (Multi-Factor Authentication, MFA)

얼굴 인식 외에도 다른 인증 방법을 결합하여 보안을 강화합니다. <p>
비밀번호: 얼굴 인식 후 비밀번호 입력을 요구합니다. <p>
OTP (One-Time Password): 얼굴 인식 후 일회용 비밀번호를 전송하고 이를 입력하도록 요구합니다. <p>
지문 인식: 얼굴 인식과 지문 인식을 결합합니다. <p>

---

3.안티-스푸핑 기술 (Anti-Spoofing Techniques) 

얼굴 이미지나 3D 모델을 사용한 위조 시도를 방지하는 기술입니다. <p>
적외선 센서: 적외선 센서를 사용하여 실제 피부의 반사를 감지합니다. 이는 일반적인 사진이나 디스플레이를 통해 위조할 수 없습니다. <p>
심도 카메라: 심도 카메라를 사용하여 얼굴의 3D 구조를 인식합니다. 평면 이미지와 3D 구조를 구분할 수 있습니다. <p>
머신러닝 알고리즘: 머신러닝 알고리즘을 사용하여 사진과 실제 얼굴을 구분하는 모델을 학습시킵니다 <p>

## 선택한 해결 방안

1. 라이브니스 감지 (Liveness Detection) <p>
노트북 카메라의 한계가 있기에 간단한 움직임을 감지하는 방식으로 사용자에게 특정 손모양을 카메라에 보이도록 요청합니다. <p>
이는 사진으로는 쉽게 위조 할 수 없는 방법입니다. <p>

일반적인 노트북 카메라는 TrueDepth 카메라 시스템처럼 고급 센서나 적외선 카메라가 포함되지 않아 애플의 Face ID와 같은 고도화된 얼굴 인식 기능을 제공하기 어렵습니다. <p>
하지만 저희는 추후 개발을 통해 다중 요인 인증 방법을 추가하거나 애플의 Face ID 기술은 고급 하드웨어와 소프트웨어를 결합하여 높은 수준의 보안을 제공하는 얼굴 인식 시스템으로, 안티 스푸핑 기술을 적용 시키고자 합니다. <p>

## 필요한 방안
3D 깊이 인식 카메라 사용:

3D 스캔: 일반 카메라가 아닌 3D 깊이 카메라를 사용하여 얼굴의 입체적인 구조를 확인합니다. 사진이나 평면 이미지를 쉽게 구분할 수 있습니다.

<br>
<br>
