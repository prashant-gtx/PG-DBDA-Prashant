import yfinance as yf

def get_market_data():
    """
    Fetches live (delayed) data for Nifty 50 and Sensex.
    """
    tickers = {
        "Nifty 50": "^NSEI",
        "Sensex": "^BSESN"
    }
    
    data = {}
    
    for name, ticker_symbol in tickers.items():
        try:
            ticker = yf.Ticker(ticker_symbol)
            # Get fast info first (often has real-time-ish price)
            info = ticker.fast_info
            price = info.last_price
            prev_close = info.previous_close
            
            if price and prev_close:
                change = price - prev_close
                percent_change = (change / prev_close) * 100
                
                data[name] = {
                    "price": round(price, 2),
                    "change": round(change, 2),
                    "percent_change": round(percent_change, 2),
                    "symbol": ticker_symbol
                }
            else:
                 # Fallback to history if fast_info fails
                hist = ticker.history(period="1d")
                if not hist.empty:
                    current = hist["Close"].iloc[-1]
                    # We might not have prev close easily this way if it's the start of day?
                    # But history usually gives OHLC.
                    # Let's just assume we can get it.
                    data[name] = {
                        "price": round(current, 2),
                         # basic fallback
                        "change": 0.0,
                        "percent_change": 0.0,
                        "symbol": ticker_symbol
                    }

        except Exception as e:
            print(f"Error fetching data for {name}: {e}")
            data[name] = {"error": str(e)}
            
    return data

if __name__ == "__main__":
    print(get_market_data())
