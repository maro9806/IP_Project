from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import subprocess
import sys
from fastapi.middleware.cors import CORSMiddleware
import os

app = FastAPI()

# CORS 설정 추가
app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:8081"],  # 스프링 부트 서버 주소
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

class InterviewRequest(BaseModel):
    self_idx: int

@app.post("/generate-interview")
async def generate_interview(request: InterviewRequest):
    try:
        # 현재 디렉토리의 interview_generator.py 실행
        current_dir = os.path.dirname(os.path.abspath(__file__))
        script_path = os.path.join(current_dir, "interview_generator.py")

        print(f"Executing script: {script_path}")
        print(f"With self_idx: {request.self_idx}")

        process = subprocess.Popen(
            [sys.executable, script_path, str(request.self_idx)],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE
        )

        stdout, stderr = process.communicate()

        # 디버깅을 위한 출력
        print(f"Process output: {stdout.decode()}")
        if stderr:
            print(f"Process error: {stderr.decode()}")

        if process.returncode != 0:
            raise HTTPException(status_code=500, detail=f"Error generating interview: {stderr.decode()}")

        return {"status": "success", "message": "Interview questions generated successfully"}

    except Exception as e:
        print(f"Error occurred: {str(e)}")
        raise HTTPException(status_code=500, detail=str(e))

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="127.0.0.1", port=8000)