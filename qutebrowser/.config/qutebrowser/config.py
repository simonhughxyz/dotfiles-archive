# 
# Qutebrowser Config
# 

# don't load auto autoconfig.yml
config.load_autoconfig(False)

# ==================== General Settings ==================================
c.confirm_quit              = ['downloads']
c.content.fullscreen.window = True
c.spellcheck.languages      = ["de-DE", "en-GB", "en-US"]
c.tabs.show                 = 'never'
c.tabs.tabs_are_windows     = True
c.url.default_page          = 'search.simonhugh.xyz'
c.url.start_pages           = ['search.simonhugh.xyz']
c.zoom.default  =  150

# ==================== Privacy & Security ================================
c.content.geolocation       = False
c.content.pdfjs             = False
c.content.webgl             = False
c.content.cookies.accept    =  'no-3rdparty'
c.content.javascript.can_access_clipboard  =  False

# ==================== Aliases ===========================================
c.aliases = {
    'w': 'session-save',
    'q': 'quit',
    'wq': 'quit --save',
}

# ==================== Bindings ==========================================
config.bind("v", "hint links spawn mpv {hint-url}")
config.bind("d", "hint links spawn ytfzf --download=1 '{hint-url}'")

# ==================== Search Engines ====================================
c.url.searchengines = {
    # DuckDuckGO
    'DEFAULT': 'https://search.simonhugh.xyz/searx/search?q={}',
    'd': 'https://duckduckgo.com/?q={}',
    # Google
    'g' :  'http://www.google.com/search?q={}',
    # Youtube
    'y' : 'https://www.youtube.com/results?search_query={}',
}
