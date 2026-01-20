import React, { useState, useEffect, useRef } from 'react';
import axios from 'axios';
import { Newspaper, TrendingUp, MessageSquare, Send, X, ExternalLink, ArrowUpRight, ArrowDownRight, Minus } from 'lucide-react';

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
    }, 5000);
    return () => clearInterval(interval);
  }, []);

  useEffect(() => {
    if (isChatOpen && chatEndRef.current) {
      chatEndRef.current.scrollIntoView({ behavior: 'smooth' });
    }
  }, [chatHistory, isChatOpen]);

  // Handle Image Error fallback
  const handleImageError = (e) => {
    e.target.style.display = 'none'; // Basic fallback, could replace with placeholder
  };

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

  const getSentimentColor = (sentiment) => {
    switch (sentiment?.toLowerCase()) {
      case 'positive': return 'from-emerald-600 to-emerald-400';
      case 'negative': return 'from-rose-600 to-rose-400';
      default: return 'from-gray-600 to-gray-400';
    }
  };

  const getSentimentIcon = (sentiment) => {
    switch (sentiment?.toLowerCase()) {
      case 'positive': return <ArrowUpRight className="w-3 h-3" />;
      case 'negative': return <ArrowDownRight className="w-3 h-3" />;
      default: return <Minus className="w-3 h-3" />;
    }
  };

  return (
    <div className="h-screen bg-[#0a0c10] text-white font-sans selection:bg-blue-500 selection:text-white flex flex-col overflow-hidden relative">

      {/* Background Glow Effects */}
      <div className="absolute top-0 left-0 w-[500px] h-[500px] bg-blue-600/10 rounded-full blur-[120px] pointer-events-none" />
      <div className="absolute bottom-0 right-0 w-[500px] h-[500px] bg-purple-600/10 rounded-full blur-[120px] pointer-events-none" />

      {/* Navbar / Header */}
      <header className="shrink-0 z-50 pt-6 px-6 pb-2">
        <div className="container mx-auto">
          <div className="bg-gray-900/40 backdrop-blur-xl border border-white/10 rounded-2xl p-4 flex flex-col md:flex-row justify-between items-center gap-4 shadow-2xl relative overflow-hidden group">
            <div className="absolute inset-0 bg-gradient-to-r from-transparent via-white/5 to-transparent translate-x-[-100%] group-hover:translate-x-[100%] transition-transform duration-1000 pointer-events-none" />

            {/* Logo */}
            <div className="flex items-center gap-3">
              <div className="p-2.5 bg-gradient-to-br from-blue-600 to-indigo-600 rounded-xl shadow-lg shadow-blue-500/20">
                <TrendingUp className="w-6 h-6 text-white" />
              </div>
              <span className="text-2xl font-bold bg-clip-text text-transparent bg-gradient-to-r from-white to-gray-400 tracking-tight">
                MarketPulse AI
              </span>
            </div>

            {/* Market Ticker Pill */}
            <div className="flex gap-6 items-center bg-black/40 px-6 py-2.5 rounded-xl border border-white/5 box-shadow-inner relative overflow-hidden">
              <div className="absolute top-0 left-0 w-1 h-full bg-blue-500/20"></div>
              {marketData ? (
                <>
                  <div className="flex items-center gap-2 border-r border-white/10 pr-4 mr-2">
                    <span className="relative flex h-2 w-2">
                      <span className="animate-ping absolute inline-flex h-full w-full rounded-full bg-emerald-400 opacity-75"></span>
                      <span className="relative inline-flex rounded-full h-2 w-2 bg-emerald-500"></span>
                    </span>
                    <span className="text-[10px] font-bold text-emerald-400 tracking-wider">LIVE</span>
                  </div>
                  {Object.entries(marketData).map(([key, data]) => (
                    <div key={key} className="flex items-center gap-3">
                      <span className="text-gray-400 text-xs font-bold uppercase tracking-wider">{key}</span>
                      <div className={`flex items-center gap-1.5 font-mono font-bold ${data.change >= 0 ? 'text-emerald-400' : 'text-rose-400'}`}>
                        {data.price.toLocaleString()}
                        <span className={`text-[10px] px-1.5 py-0.5 rounded-full ${data.change >= 0 ? 'bg-emerald-400/10' : 'bg-rose-400/10'}`}>
                          ({data.change >= 0 ? '+' : ''}{data.percent_change}%)
                        </span>
                        {data.change >= 0 ? <ArrowUpRight className="w-3 h-3" /> : <ArrowDownRight className="w-3 h-3" />}
                      </div>
                    </div>
                  ))}
                </>
              ) : (
                <div className="text-gray-500 text-xs animate-pulse">Connecting to Market Data...</div>
              )}
            </div>
          </div>
        </div>
      </header>

      {/* Main Content - Scrollable Content Area */}
      <main className="flex-1 container mx-auto px-6 py-4 overflow-hidden flex flex-col relative z-10">

        {/* News Grid */}
        <div className="flex-1 overflow-y-auto pr-2 pb-24 -mr-2 scrollbar-thin scrollbar-thumb-gray-800 scrollbar-track-transparent">
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-5">
            {news.length === 0 && Array.from({ length: 9 }).map((_, i) => (
              <div key={i} className="h-64 bg-gray-800/40 rounded-2xl animate-pulse border border-white/5"></div>
            ))}

            {news.map((item, idx) => (
              <div key={idx} className="group bg-gray-900/40 backdrop-blur-md border border-white/10 rounded-2xl p-3 hover:bg-gray-800/60 transition-all duration-300 hover:border-blue-500/30 hover:shadow-2xl hover:shadow-blue-900/20 hover:-translate-y-1 flex flex-col h-full relative overflow-hidden">

                {/* Image Section */}
                <div className="relative h-44 rounded-xl overflow-hidden mb-4 shrink-0 bg-gray-800">
                  {item.image_url ? (
                    <img
                      src={item.image_url}
                      onError={handleImageError}
                      alt="News"
                      className="w-full h-full object-cover transition-transform duration-700 group-hover:scale-110 opacity-90 group-hover:opacity-100"
                    />
                  ) : (
                    <div className="w-full h-full flex items-center justify-center bg-gradient-to-br from-gray-800 to-gray-900">
                      <Newspaper className="w-10 h-10 text-gray-700" />
                    </div>
                  )}

                  {/* Sentiment Badge Overlay */}
                  <div className={`absolute top-3 right-3 px-2.5 py-1 rounded-full text-[10px] font-bold uppercase tracking-wide text-white shadow-lg backdrop-blur-md flex items-center gap-1 bg-gradient-to-r ${getSentimentColor(item.sentiment)}`}>
                    {getSentimentIcon(item.sentiment)}
                    {item.sentiment}
                  </div>

                  {/* Gradient Overlay for Text Readability if needed */}
                  <div className="absolute inset-0 bg-gradient-to-t from-gray-900/80 via-transparent to-transparent opacity-60" />
                </div>

                {/* Content */}
                <div className="px-2 pb-2 flex-1 flex flex-col">
                  <div className="flex justify-between items-center mb-2">
                    <span className="text-gray-500 text-[10px] font-mono flex items-center gap-1">
                      TIMELINE <span className="w-1 h-1 bg-gray-600 rounded-full" /> {item.timestamp.split(' ')[1]}
                    </span>
                  </div>

                  <h3 className="font-semibold text-base leading-snug text-gray-100 group-hover:text-blue-100 transition-colors mb-3 line-clamp-3">
                    {item.headline}
                  </h3>

                  <div className="mt-auto flex justify-end">
                    <a href={item.link} target="_blank" rel="noreferrer" className="flex items-center gap-1 text-xs font-bold text-blue-400 group-hover:text-blue-300 transition-colors pointer-events-auto">
                      READ MORE <ExternalLink className="w-3 h-3" />
                    </a>
                  </div>
                </div>
              </div>
            ))}
          </div>
        </div>
      </main>

      {/* Floating Chat Interface */}
      <div className="fixed bottom-8 right-8 z-[100] flex flex-col items-end pointer-events-none">

        {/* Chat Window */}
        <div className={`
          mb-4 w-[550px] h-[750px] max-h-[80vh] bg-[#0F1115]/95 backdrop-blur-xl border border-white/10 rounded-3xl shadow-2xl flex flex-col overflow-hidden transition-all duration-300 origin-bottom-right pointer-events-auto
          ${isChatOpen ? 'opacity-100 scale-100 translate-y-0' : 'opacity-0 scale-95 translate-y-10 pointer-events-none'}
        `}>
          {/* Header */}
          <div className="flex items-center justify-between p-4 bg-gradient-to-r from-blue-900/30 to-purple-900/30 border-b border-white/10 shrink-0">
            <div className="flex items-center gap-3">
              <div className="relative">
                <div className="w-8 h-8 rounded-full bg-gradient-to-tr from-blue-500 to-cyan-400 flex items-center justify-center shadow-lg shadow-blue-500/20">
                  <MessageSquare className="w-4 h-4 text-white" />
                </div>
                <div className="absolute -bottom-0.5 -right-0.5 w-2.5 h-2.5 bg-emerald-500 border-2 border-[#0F1115] rounded-full"></div>
              </div>
              <div>
                <h3 className="font-bold text-sm text-gray-100">MarketPulse Assistant</h3>
                <p className="text-[10px] text-blue-300/80">Powered by Gemini 2.5</p>
              </div>
            </div>
            <button onClick={() => setIsChatOpen(false)} className="p-2 hover:bg-white/5 rounded-full transition-colors text-gray-400 hover:text-white">
              <X className="w-5 h-5" />
            </button>
          </div>

          {/* Messages */}
          <div className="flex-1 overflow-y-auto p-4 space-y-4 scrollbar-thin scrollbar-thumb-gray-800 scrollbar-track-transparent bg-gradient-to-b from-transparent to-black/20">
            {chatHistory.length === 0 && (
              <div className="flex flex-col items-center justify-center h-full text-center p-6 space-y-4">
                <div className="w-16 h-16 bg-blue-500/10 rounded-2xl flex items-center justify-center rotate-3 border border-blue-500/20">
                  <TrendingUp className="w-8 h-8 text-blue-400" />
                </div>
                <div>
                  <h4 className="text-gray-200 font-medium mb-1">How can I help you?</h4>
                  <p className="text-xs text-gray-500 mb-4">Ask about market trends, or try these suggestions:</p>

                  <div className="flex flex-col gap-2 w-full">
                    {news.slice(0, 3).map((item, i) => (
                      <button
                        key={i}
                        onClick={() => setChatQuery(item.suggested_question ? `Analyze: ${item.suggested_question}` : `Analyze: ${item.headline}`)}
                        className="w-full text-[10px] bg-gray-800/50 hover:bg-blue-600/20 border border-white/5 hover:border-blue-500/50 rounded-xl p-2.5 text-left transition-all group overflow-hidden"
                      >
                        <span className="block text-blue-400 font-bold mb-0.5 group-hover:text-blue-300">Analysis Request</span>
                        <span className="block text-gray-400 truncate group-hover:text-gray-200 w-full overflow-hidden text-ellipsis whitespace-nowrap">
                          {item.suggested_question || item.headline}
                        </span>
                      </button>
                    ))}
                    <button
                      onClick={() => setChatQuery("Summarize the overall market sentiment based on today's news.")}
                      className="text-[10px] bg-gray-800/50 hover:bg-purple-600/20 border border-white/5 hover:border-purple-500/50 rounded-xl p-2 text-center transition-all text-gray-400 hover:text-purple-300"
                    >
                      Market Sentiment Summary
                    </button>
                  </div>
                </div>
              </div>
            )}

            {chatHistory.map((msg, idx) => (
              <div key={idx} className={`flex ${msg.role === 'user' ? 'justify-end' : 'justify-start'} animate-in fade-in slide-in-from-bottom-2 duration-300`}>
                <div className={`
                  max-w-[85%] p-3.5 rounded-2xl text-xs leading-relaxed shadow-sm
                  ${msg.role === 'user'
                    ? 'bg-blue-600 text-white rounded-tr-sm shadow-blue-500/10'
                    : 'bg-gray-800/80 border border-white/5 text-gray-200 rounded-tl-sm backdrop-blur-sm'}
                `}>
                  {msg.content}
                </div>
              </div>
            ))}

            {loadingChat && (
              <div className="flex justify-start">
                <div className="bg-gray-800/50 rounded-2xl p-3 flex gap-1.5 items-center">
                  <div className="w-1.5 h-1.5 bg-blue-400 rounded-full animate-bounce [animation-delay:-0.3s]"></div>
                  <div className="w-1.5 h-1.5 bg-blue-400 rounded-full animate-bounce [animation-delay:-0.15s]"></div>
                  <div className="w-1.5 h-1.5 bg-blue-400 rounded-full animate-bounce"></div>
                </div>
              </div>
            )}
            <div ref={chatEndRef} />
          </div>

          {/* Input */}
          <div className="p-4 bg-[#0F1115] border-t border-white/5 shrink-0">
            <form onSubmit={handleChatSubmit} className="relative group">
              <input
                type="text"
                value={chatQuery}
                onChange={(e) => setChatQuery(e.target.value)}
                placeholder="Type your message..."
                className="w-full bg-gray-900 border border-gray-800 rounded-xl pl-4 pr-12 py-3 text-xs text-white placeholder-gray-500 focus:outline-none focus:border-blue-500/50 focus:bg-gray-900/50 transition-all"
              />
              <button
                type="submit"
                disabled={loadingChat || !chatQuery.trim()}
                className="absolute right-2 top-2 p-1.5 bg-gradient-to-r from-blue-600 to-indigo-600 rounded-lg text-white disabled:opacity-50 hover:shadow-lg hover:shadow-blue-500/20 transition-all hover:scale-105 active:scale-95"
              >
                <Send className="w-4 h-4" />
              </button>
            </form>
          </div>
        </div>

        {/* FAB */}
        <button
          onClick={() => setIsChatOpen(!isChatOpen)}
          className={`
            pointer-events-auto p-0 w-16 h-16 rounded-full shadow-2xl flex items-center justify-center transition-all duration-300 hover:scale-110 active:scale-95 border border-white/10 relative overflow-hidden group
            ${isChatOpen ? 'bg-gray-800 rotate-90' : 'bg-transparent'}
            `}
        >
          {!isChatOpen && (
            <div className="absolute inset-0 bg-gradient-to-br from-blue-600 to-purple-600 opacity-100 group-hover:opacity-90 transition-opacity" />
          )}

          <div className="relative z-10 text-white">
            {isChatOpen ? <X className="w-7 h-7" /> : <MessageSquare className="w-7 h-7" />}
          </div>

          {/* Glow effect behind FAB */}
          {!isChatOpen && <div className="absolute inset-0 bg-blue-500 blur-xl opacity-50 -z-10" />}
        </button>
      </div>
    </div>
  );
}

export default App;
