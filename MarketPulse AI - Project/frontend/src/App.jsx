import React, { useState, useEffect, useRef } from 'react';
import axios from 'axios';
import { Newspaper, TrendingUp, MessageSquare, Send, X, ChevronUp, ChevronDown, ExternalLink } from 'lucide-react';

const API_BASE = "http://localhost:8000";

function App() {
  const [news, setNews] = useState([]);
  const [marketData, setMarketData] = useState(null);
  const [chatQuery, setChatQuery] = useState("");
  const [chatHistory, setChatHistory] = useState([]);
  const [loadingChat, setLoadingChat] = useState(false);
  const [isChatOpen, setIsChatOpen] = useState(false);
  const chatEndRef = useRef(null);

  useEffect(() => {
    fetchNews();
    fetchMarketData();
    const interval = setInterval(() => {
      fetchNews();
      fetchMarketData();
    }, 30000);
    return () => clearInterval(interval);
  }, []);

  useEffect(() => {
    if (isChatOpen && chatEndRef.current) {
      chatEndRef.current.scrollIntoView({ behavior: 'smooth' });
    }
  }, [chatHistory, isChatOpen]);

  const fetchNews = async () => {
    try {
      const res = await axios.get(`${API_BASE}/news`);
      setNews(res.data);
    } catch (err) {
      console.error("Error fetching news:", err);
    }
  };

  const fetchMarketData = async () => {
    try {
      const res = await axios.get(`${API_BASE}/market`);
      setMarketData(res.data);
    } catch (err) {
      console.error("Error fetching market data:", err);
    }
  };

  const handleChatSubmit = async (e) => {
    e.preventDefault();
    if (!chatQuery.trim()) return;

    const query = chatQuery;
    setChatQuery("");
    setChatHistory(prev => [...prev, { role: 'user', content: query }]);
    setLoadingChat(true);

    try {
      const res = await axios.post(`${API_BASE}/chat`, { query });
      setChatHistory(prev => [...prev, { role: 'ai', content: res.data.response }]);
    } catch (err) {
      setChatHistory(prev => [...prev, { role: 'ai', content: "Error communicating with AI." }]);
    } finally {
      setLoadingChat(false);
    }
  };

  return (
    <div className="h-screen bg-gradient-to-br from-gray-900 via-slate-900 to-black text-white font-sans selection:bg-blue-500 selection:text-white flex flex-col overflow-hidden">

      {/* Navbar / Header - Fixed Height */}
      <header className="shrink-0 z-50 backdrop-blur-md bg-gray-900/80 border-b border-white/10 shadow-lg">
        <div className="container mx-auto px-6 py-3 flex justify-between items-center gap-4">
          <div className="flex items-center gap-3">
            <div className="p-2 bg-blue-500/20 rounded-lg">
              <TrendingUp className="w-6 h-6 text-blue-400" />
            </div>
            <h1 className="text-2xl font-bold bg-clip-text text-transparent bg-gradient-to-r from-blue-400 to-purple-400 tracking-tight hidden md:block">
              MarketPulse AI
            </h1>
          </div>

          {/* Market Ticker */}
          <div className="flex gap-4 items-center bg-white/5 px-4 py-1.5 rounded-full border border-white/10 backdrop-blur-sm overflow-x-auto no-scrollbar">
            {marketData ? Object.entries(marketData).map(([key, data]) => (
              <div key={key} className="flex flex-col items-end min-w-[80px]">
                <span className="text-gray-400 text-[10px] font-medium uppercase tracking-wider">{key}</span>
                <div className="flex items-center gap-2">
                  <span className={`text-sm font-mono font-bold ${data.change >= 0 ? 'text-emerald-400' : 'text-rose-400'}`}>
                    {data.price.toLocaleString()}
                  </span>
                  <span className={`text-[10px] px-1 py-0.5 rounded font-bold ${data.change >= 0 ? 'bg-emerald-500/20 text-emerald-300' : 'bg-rose-500/20 text-rose-300'}`}>
                    {data.change >= 0 ? '+' : ''}{data.percent_change}%
                  </span>
                </div>
              </div>
            )) : (
              <div className="text-gray-500 text-xs animate-pulse">Loading Market Data...</div>
            )}
          </div>
        </div>
      </header>

      {/* Main Content - Scrollable */}
      <main className="flex-1 container mx-auto px-6 py-6 overflow-hidden flex flex-col">
        <div className="flex items-center gap-2 mb-4 shrink-0">
          <Newspaper className="w-5 h-5 text-blue-400" />
          <h2 className="text-xl font-bold text-gray-100">Live Financial News</h2>
          <div className="ml-auto text-xs text-gray-400">
            Auto-refresh active
          </div>
        </div>

        {/* Scrollable News Grid */}
        <div className="flex-1 overflow-y-auto pr-2 pb-20 scrollbar-thin scrollbar-thumb-gray-700 scrollbar-track-transparent">
          <div className="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 gap-4">
            {news.length === 0 && Array.from({ length: 9 }).map((_, i) => (
              <div key={i} className="h-32 bg-gray-800/50 rounded-xl animate-pulse border border-white/5"></div>
            ))}

            {news.map((item, idx) => (
              <div key={idx} className="group bg-gray-800/40 backdrop-blur-sm border border-white/10 rounded-xl p-4 hover:bg-gray-800/60 transition-all duration-300 hover:border-blue-500/30 flex gap-4 h-full">
                {/* Thumbnail Image */}
                {item.image_url ? (
                  <div className="w-24 h-24 shrink-0 rounded-lg overflow-hidden relative border border-white/5">
                    <img
                      src={item.image_url}
                      alt="News Thumbnail"
                      className="w-full h-full object-cover group-hover:scale-110 transition-transform duration-500"
                    />
                  </div>
                ) : (
                  <div className="w-24 h-24 shrink-0 rounded-lg bg-gray-700/50 flex items-center justify-center border border-white/5">
                    <Newspaper className="w-8 h-8 text-gray-600" />
                  </div>
                )}

                {/* Content */}
                <div className="flex-1 flex flex-col justify-between min-w-0">
                  <div>
                    <div className="flex justify-between items-start mb-2">
                      <span className={`px-2 py-0.5 rounded text-[10px] font-bold uppercase tracking-wider
                        ${item.sentiment === 'positive' ? 'bg-emerald-500/20 text-emerald-400 border border-emerald-500/30' :
                          item.sentiment === 'negative' ? 'bg-rose-500/20 text-rose-400 border border-rose-500/30' :
                            'bg-gray-500/20 text-gray-400 border border-gray-500/30'}`}>
                        {item.sentiment}
                      </span>
                      <span className="text-gray-500 text-[10px] font-mono whitespace-nowrap ml-2">{item.timestamp.split(' ')[1]}</span>
                    </div>

                    <h3 className="font-semibold text-sm leading-snug text-gray-200 group-hover:text-blue-200 transition-colors line-clamp-3 mb-2" title={item.headline}>
                      {item.headline}
                    </h3>
                  </div>

                  <a href={item.link} target="_blank" rel="noreferrer" className="text-blue-400 text-xs font-medium hover:text-blue-300 hover:underline flex items-center gap-1 mt-auto">
                    Read More <ExternalLink className="w-3 h-3" />
                  </a>
                </div>
              </div>
            ))}
          </div>
        </div>
      </main>

      {/* Floating Chat Interface */}
      <div className="fixed bottom-6 right-6 z-[100] flex flex-col items-end pointer-events-none">
        {/* Pointer events none on container so it doesn't block clicks, re-enabled on children */}

        {/* Chat Window */}
        <div className={`
          mb-4 w-[380px] h-[500px] bg-gray-900/95 backdrop-blur-xl border border-white/10 rounded-2xl shadow-2xl flex flex-col overflow-hidden transition-all duration-300 origin-bottom-right pointer-events-auto
          ${isChatOpen ? 'opacity-100 scale-100 translate-y-0' : 'opacity-0 scale-95 translate-y-10 pointer-events-none'}
        `}>
          {/* Header */}
          <div className="flex items-center justify-between p-3 bg-gradient-to-r from-blue-600/20 to-purple-600/20 border-b border-white/10 shrink-0">
            <div className="flex items-center gap-2">
              <div className="p-1.5 bg-blue-500 rounded-lg">
                <MessageSquare className="w-4 h-4 text-white" />
              </div>
              <h3 className="font-bold text-sm">MarketPulse AI</h3>
            </div>
            <button onClick={() => setIsChatOpen(false)} className="p-1.5 hover:bg-white/10 rounded-lg transition-colors text-gray-400 hover:text-white">
              <X className="w-4 h-4" />
            </button>
          </div>

          {/* Messages */}
          <div className="flex-1 overflow-y-auto p-4 space-y-4 scrollbar-thin scrollbar-thumb-gray-700 scrollbar-track-transparent">
            {chatHistory.length === 0 && (
              <div className="flex flex-col items-center justify-center h-full text-center p-6 text-gray-500 space-y-4">
                <p className="text-xs">
                  Ask me about today's market trends!
                </p>
              </div>
            )}

            {chatHistory.map((msg, idx) => (
              <div key={idx} className={`flex ${msg.role === 'user' ? 'justify-end' : 'justify-start'}`}>
                <div className={`
                  max-w-[85%] p-3 rounded-2xl text-xs leading-relaxed shadow-sm
                  ${msg.role === 'user'
                    ? 'bg-blue-600 text-white rounded-tr-sm'
                    : 'bg-gray-800 border border-white/10 text-gray-200 rounded-tl-sm'}
                `}>
                  {msg.content}
                </div>
              </div>
            ))}

            {loadingChat && (
              <div className="text-xs text-gray-500 animate-pulse">Thinking...</div>
            )}
            <div ref={chatEndRef} />
          </div>

          {/* Input */}
          <div className="p-3 bg-gray-900 border-t border-white/10 shrink-0">
            <form onSubmit={handleChatSubmit} className="relative">
              <input
                type="text"
                value={chatQuery}
                onChange={(e) => setChatQuery(e.target.value)}
                placeholder="Ask..."
                className="w-full bg-gray-800 border border-white/10 rounded-xl pl-3 pr-10 py-2.5 text-xs text-white placeholder-gray-500 focus:outline-none focus:border-blue-500/50"
              />
              <button
                type="submit"
                disabled={loadingChat || !chatQuery.trim()}
                className="absolute right-1.5 top-1.5 p-1.5 bg-blue-600 rounded-lg text-white disabled:opacity-50 hover:bg-blue-500 transition-colors"
              >
                <Send className="w-3 h-3" />
              </button>
            </form>
          </div>
        </div>

        {/* Floating Action Button */}
        <button
          onClick={() => setIsChatOpen(!isChatOpen)}
          className={`
            pointer-events-auto p-4 rounded-full shadow-2xl flex items-center justify-center transition-all duration-300 hover:scale-110 active:scale-95 border border-white/10
            ${isChatOpen ? 'bg-gray-800 text-white rotate-90' : 'bg-gradient-to-r from-blue-600 to-purple-600 text-white'}
          `}
        >
          {isChatOpen ? <X className="w-6 h-6" /> : <MessageSquare className="w-6 h-6" />}
        </button>
      </div>

    </div>
  );
}

export default App;
