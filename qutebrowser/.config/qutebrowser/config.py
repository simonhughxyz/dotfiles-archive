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
c.zoom.default              = 150
c.content.autoplay          = False
c.content.mute              = True
c.editor.command            = ['st', '-e', 'nvim', '-f', '{file}', '-c', 
    'normal{line}G{column0}l']

# ==================== Privacy & Security ================================
c.content.geolocation       = False
c.content.pdfjs             = False
c.content.webgl             = False
c.content.cookies.accept    = 'no-3rdparty'
c.content.javascript.can_access_clipboard = False
c.content.headers.referer   = 'same-domain'
c.content.dns_prefetch      = False
c.content.canvas_reading    = False
c.content.headers.do_not_track = False    # can be used to fingerprint
c.content.webrtc_ip_handling_policy = 'disable-non-proxied-udp'
c.content.hyperlink_auditing = False

# ==================== Adblock ===========================================
c.content.blocking.enabled  = True
c.content.blocking.method   = 'both'
c.content.blocking.hosts.block_subdomains   = True
c.content.blocking.adblock.lists    = [
        "https://easylist.to/easylist/easylist.txt",
        "https://easylist.to/easylist/easyprivacy.txt",
        "https://easylist.to/easylist/fanboy-social.txt",
        "https://secure.fanboy.co.nz/fanboy-cookiemonster.txt",
        "https://secure.fanboy.co.nz/fanboy-annoyance.txt",
        "https://easylist-downloads.adblockplus.org/antiadblockfilters.txt",
        "https://curben.gitlab.io/malware-filter/urlhaus-filter.txt",
        "https://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts&showintro=0",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/legacy.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2020.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2021.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badware.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/privacy.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/resource-abuse.txt",
]

# ==================== Dark Mode =========================================
c.colors.webpage.darkmode.enabled  =  True
c.colors.webpage.darkmode.algorithm  =  'lightness-cielab'
c.colors.webpage.darkmode.policy.images  =  'smart'
c.colors.webpage.darkmode.threshold.background  =  150
c.colors.webpage.darkmode.threshold.text  =  120
c.colors.webpage.bg  =  '#000000'

# ==================== Aliases ===========================================
c.aliases = {
    'w': 'session-save',
    'q': 'quit',
    'wq': 'quit --save',
}

# ==================== Bindings ==========================================
leader = "<Space>"
config.bind("m", "tab-mute")
config.bind(leader + "v", "hint links spawn mpv {hint-url}")
config.bind(leader + "V", "hint links spawn mpv {url}")
config.bind(leader + "d", "hint links spawn ytfzf --download=1 '{hint-url}'")
config.bind(leader + "D", "spawn ytfzf --download=1 '{url}'")

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
