import requests
from bs4 import BeautifulSoup
import json
import time
from datetime import datetime
import os

# CONFIG
NEWS_URL = "https://www.moneycontrol.com/news/business/"
JSON_FILE = "moneycontrol_news.json"
HEADERS = {
    "User-Agent": "Mozilla/5.0"
}

def load_existing_news():
    if os.path.exists(JSON_FILE):
        try:
            with open(JSON_FILE, "r", encoding="utf-8") as f:
                return json.load(f)
        except json.JSONDecodeError:
            return []
    return []

def save_news(news_list):
    with open(JSON_FILE, "w", encoding="utf-8") as f:
        json.dump(news_list, f, indent=4, ensure_ascii=False)

def scrape_moneycontrol():
    try:
        response = requests.get(NEWS_URL, headers=HEADERS, timeout=10)
        response.raise_for_status()
    except requests.RequestException as e:
        print(f"Error scraping Moneycontrol: {e}")
        return []

    soup = BeautifulSoup(response.text, "html.parser")

    articles = soup.find_all("li", class_="clearfix")
    scraped_news = []

    for article in articles:
        title_tag = article.find("h2")
        link_tag = article.find("a")

        if not title_tag or not link_tag:
            continue

        headline = title_tag.text.strip()
        link = link_tag.get("href")
        
        # Try to get image if available
        img_tag = article.find("img")
        image_url = img_tag.get("data-src") if img_tag else (img_tag.get("src") if img_tag else None)

        # Try to find a timestamp or description if available
        # This part might need adjustment based on actual HTML structure if we want more details
        # For now keeping it simple as per original scraper

        timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

        
        # Analyze sentiment
        from sentiment import analyze_sentiment
        sentiment_result = analyze_sentiment(headline)
        sentiment_label = sentiment_result['label']
        sentiment_score = sentiment_result['score']

        scraped_news.append({
            "headline": headline,
            "link": link,
            "image_url": image_url,
            "timestamp": timestamp,
            "sentiment": sentiment_label,
            "sentiment_score": sentiment_score
        })

    return scraped_news

def remove_duplicates(existing_news, new_news):
    existing_links = {item["link"] for item in existing_news}
    unique_news = []
    for item in new_news:
        if item["link"] not in existing_links:
            unique_news.append(item)
    return unique_news

def get_latest_news():
    """
    Main function to be called by the API.
    Scrapes new news, updates the JSON file, and returns the latest list.
    """
    existing_news = load_existing_news()
    new_scraped_news = scrape_moneycontrol()
    
    if new_scraped_news:
        unique_news = remove_duplicates(existing_news, new_scraped_news)
        if unique_news:
            # Prepend new news so they appear first
            updated_news = unique_news + existing_news
            # Limit to last 100 articles to keep file size manageable? 
            # For now, keep all as requested, but maybe consider a limit later.
            save_news(updated_news)
            return updated_news
    
    return existing_news

if __name__ == "__main__":
    print(get_latest_news())
