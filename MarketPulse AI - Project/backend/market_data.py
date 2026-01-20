import yfinance as yf

def get_market_data():
    """
    Fetches live (delayed) data for Nifty 50 and Sensex.
    """
    indices_tickers = {
        "Nifty 50": "^NSEI",
        "Sensex": "^BSESN"
    }
    
    commodities_tickers = {
        "Gold": "GC=F",
        "Silver": "SI=F",
        "USD/INR": "INR=X",
        "EUR/INR": "EURINR=X",
        "BTC/USD": "BTC-USD"
    }
    
    indices_data = {}
    commodities_data = {}
    
    # Helper to fetch data with history for sparkline
    def fetch_ticker_data_with_history(name, symbol):
        try:
            ticker = yf.Ticker(symbol)
            # Fetch 1 day history with 5m interval for sparkline
            hist = ticker.history(period="1d", interval="5m")
            
            if hist.empty:
                return None
            
            current = hist["Close"].iloc[-1]
            start_open = hist["Open"].iloc[0] # or Close[0]
            
            # Calculate change from start of day (or prev close if available via fast_info)
            # Using hist for consistency in sparkline logic
            change = current - start_open
            percent_change = (change / start_open) * 100
            
            # Get last 20 points for sparkline
            sparkline_points = hist["Close"].tail(20).tolist()
            
            return {
                "price": round(current, 2),
                "change": round(change, 2),
                "percent_change": round(percent_change, 2),
                "symbol": symbol,
                "history": sparkline_points
            }
        except Exception as e:
            print(f"Error {name}: {e}")
            return None

    # Helper for commodities (keep lightweight)
    def fetch_ticker_data(name, symbol):
        try:
            ticker = yf.Ticker(symbol)
            info = ticker.fast_info
            price = info.last_price
            prev_close = info.previous_close
            
            if price and prev_close:
                change = price - prev_close
                percent_change = (change / prev_close) * 100
                return {
                    "price": round(price, 2),
                    "change": round(change, 2),
                    "percent_change": round(percent_change, 2),
                    "symbol": symbol
                }
        except:
             pass
        return None

    # Fetch Indices (With History)
    for name, sym in indices_tickers.items():
        res = fetch_ticker_data_with_history(name, sym)
        if res: indices_data[name] = res

    # Fetch Commodities (Fast)
    for name, sym in commodities_tickers.items():
        res = fetch_ticker_data(name, sym)
        if res: commodities_data[name] = res
            
    return {
        "indices": indices_data,
        "commodities": commodities_data
    }

if __name__ == "__main__":
    print(get_market_data())
