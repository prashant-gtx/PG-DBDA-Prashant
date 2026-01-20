from transformers import BertTokenizer, BertForSequenceClassification, pipeline
import torch

# Initialize model globally to avoid reloading on every request
model_name = "ProsusAI/finbert"
tokenizer = None
model = None
nlp = None

def init_model():
    global tokenizer, model, nlp
    if nlp is None:
        print("Loading FinBERT model...")
        tokenizer = BertTokenizer.from_pretrained(model_name)
        model = BertForSequenceClassification.from_pretrained(model_name)
        nlp = pipeline("sentiment-analysis", model=model, tokenizer=tokenizer)
        print("FinBERT model loaded.")

def analyze_sentiment(text):
    if nlp is None:
        init_model()
    
    try:
        results = nlp(text)
        # results is a list of dicts, e.g., [{'label': 'positive', 'score': 0.95}]
        if results:
            return results[0]
    except Exception as e:
        print(f"Error in sentiment analysis: {e}")
    
    return {"label": "neutral", "score": 0.0}

if __name__ == "__main__":
    init_model()
    print(analyze_sentiment("Stocks match records as investors continue to confirm"))
