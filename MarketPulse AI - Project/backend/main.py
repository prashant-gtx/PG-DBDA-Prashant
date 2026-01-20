from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
import uvicorn
import os
from dotenv import load_dotenv

# Import our modules
from scraper import get_latest_news
from sentiment import init_model as init_sentiment
from market_data import get_market_data
from chatbot import get_chat_response, init_gemini

# Load env vars
load_dotenv()

app = FastAPI(title="MarketPulse AI Backend")

# CORS setup
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"], # For dev, allow all
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

class ChatRequest(BaseModel):
    query: str

@app.on_event("startup")
async def startup_event():
    init_sentiment()
    init_gemini()

@app.get("/")
def read_root():
    return {"message": "Welcome to MarketPulse AI API"}

@app.get("/news")
def read_news():
    try:
        news = get_latest_news()
        return news
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/market")
def read_market():
    return get_market_data()

@app.post("/chat")
def chat(request: ChatRequest):
    response = get_chat_response(request.query)
    return {"response": response}

if __name__ == "__main__":
    uvicorn.run("main:app", host="0.0.0.0", port=8000, reload=True)
