import google.generativeai as genai
import os
from scraper import get_latest_news

# Basic setup - expects GEMINI_API_KEY in env
model = None

def init_gemini():
    global model
    api_key = os.getenv("GEMINI_API_KEY")
    if api_key:
        try:
            genai.configure(api_key=api_key)
            model = genai.GenerativeModel('gemini-2.5-flash')
            print("Gemini model initialized.")
        except Exception as e:
            print(f"Error initializing Gemini: {e}")
    else:
        print("Warning: GEMINI_API_KEY not found. Chatbot will not work.")

def get_chat_response(user_query):
    if not model:
        init_gemini()
        if not model:
            return "Error: Gemini API key not configured. Please set GEMINI_API_KEY."

    # Get context from latest news
    news = get_latest_news()
    
    # Create a summary context from the top 10 news items, including impact data
    context = "Here is the latest financial news and historical analysis:\n"
    for item in news[:10]:
        impact_str = ""
        if item.get('ticker') and item.get('actual_impact') is not None:
            impact_str = f" [Historical Impact: {item['ticker']} moved {item['actual_impact']}%]"
        
        context += f"- {item['headline']} ({item['timestamp']}) - Sentiment: {item.get('sentiment', 'Unknown')}{impact_str}\n"

    prompt = f"""You are a helpful financial assistant for MarketPulse AI.
    Use the provided news context to answer the user's question.
    
    CRITICAL INSTRUCTION:
    If the context contains "Historical Impact" data for a company the user is asking about, YOU MUST mentions it.
    Example: "Based on similar past news, this stock moved X%."
    
    Context:
    {context}
    
    User Question: {user_query}
    """

    try:
        response = model.generate_content(prompt)
        return response.text
    except Exception as e:
        return f"Error getting response from Gemini: {e}"

if __name__ == "__main__":
    # Test only if key is set
    pass
