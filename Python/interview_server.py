from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import subprocess
import sys
from fastapi.middleware.cors import CORSMiddleware
import os

app = FastAPI()

#sys.stdin.reconfigure(encoding='utf-8')
#sys.stdout.reconfigure(encoding='utf-8')

app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:8081"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

class InterviewRequest(BaseModel):
    self_idx: int

@app.post("/generate-interview")
async def generate_interview(request: InterviewRequest):
    try:
        current_dir = os.path.dirname(os.path.abspath(__file__))
        script_path = os.path.join(current_dir, "interview_generator.py")

        # 환경변수 설정
        my_env = os.environ.copy()
        my_env["PYTHONIOENCODING"] = "cp949"

        # 명령어 실행
        process = subprocess.Popen(
            [sys.executable, script_path, str(request.self_idx)],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            env=my_env,
            encoding='cp949',  # Windows 한글 인코딩
            text=True
        )

        stdout, stderr = process.communicate()

        print(f"Process output: {stdout}")
        if stderr:
            print(f"Process error: {stderr}")

        if process.returncode != 0:
            raise HTTPException(
                status_code=500,
                detail={
                    "message": "Error generating interview",
                    "stdout": stdout,
                    "stderr": stderr
                }
            )

        return {
            "status": "success",
            "message": "Interview questions generated successfully",
            "output": stdout
        }

    except Exception as e:
        print(f"Error occurred: {str(e)}")
        raise HTTPException(
            status_code=500,
            detail=str(e)
        )

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(
        app,
        host="127.0.0.1",
        port=8000,
        reload=True
    )