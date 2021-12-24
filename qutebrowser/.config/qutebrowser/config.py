# 
# Qutebrowser Config
# 

# ==================== General Settings ==================================
c.confirm_quit              = ['downloads']
c.content.fullscreen.window = True
c.spellcheck.languages      = ["de-DE", "en-GB", "en-US"]
c.tabs.show                 = 'never'
c.tabs.tabs_are_windows     = True
c.url.default_page          = 'about:blank'
c.url.start_pages           = ['about:blank']
c.zoom.default              = 150
c.content.autoplay          = False
c.content.mute              = True
c.editor.command            = ['st', '-e', 'nvim', '-f', '{file}', '-c', 
    'normal{line}G{column0}l']

# ==================== Privacy & Security ================================
c.content.javascript.enabled = False
c.content.cookies.accept    = 'never'
c.content.plugins           = False
c.content.geolocation       = False
c.content.pdfjs             = False
c.content.webgl             = False
c.content.javascript.can_access_clipboard = False
c.content.headers.referer   = 'same-domain'
c.content.dns_prefetch      = False
c.content.canvas_reading    = True  # some websites break when disabled
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
c.content.blocking.hosts.lists      = [
        "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts",
]

# ==================== Dark Mode =========================================
c.colors.webpage.darkmode.enabled  =  True
c.colors.webpage.darkmode.algorithm  =  'lightness-cielab'
c.colors.webpage.darkmode.policy.images  =  'smart'
c.colors.webpage.darkmode.threshold.background  =  150
c.colors.webpage.darkmode.threshold.text  =  120
c.colors.webpage.bg  =  '#000000'
c.content.user_stylesheets = ['~/.config/qutebrowser/css/custom-dark.css'] 

# ==================== Aliases ===========================================
c.aliases = {
    'w': 'session-save',
    'q': 'quit',
    'wq': 'quit --save',
    'cs': 'config-source',
    'au': 'adblock-update',
}

# ==================== Bindings ==========================================

# toggle bindings
config.bind("tch", "config-cycle -p -t -u *://{url:host}/* content.cookies.accept no-3rdparty never ;; reload")
config.bind("tCh", "config-cycle -p -u *://{url:host}/* content.cookies.accept no-3rdparty never ;; reload")
config.bind("tcH", "config-cycle -p -t -u *://*.{url:host}/* content.cookies.accept no-3rdparty never ;; reload")
config.bind("tCH", "config-cycle -p -u *://*.{url:host}/* content.cookies.accept no-3rdparty never ;; reload")
config.bind("tcu", "config-cycle -p -t -u {url} content.cookies.accept no-3rdparty never ;; reload")
config.bind("tCu", "config-cycle -p -u {url} content.cookies.accept no-3rdparty never ;; reload")

config.bind("tcah", "config-cycle -p -t -u *://{url:host}/* content.cookies.accept all never ;; reload")
config.bind("tCah", "config-cycle -p -u *://{url:host}/* content.cookies.accept all never ;; reload")
config.bind("tcaH", "config-cycle -p -t -u *://*.{url:host}/* content.cookies.accept all never ;; reload")
config.bind("tCaH", "config-cycle -p -u *://*.{url:host}/* content.cookies.accept all never ;; reload")
config.bind("tcau", "config-cycle -p -t -u {url} content.cookies.accept all never ;; reload")
config.bind("tCau", "config-cycle -p -u {url} content.cookies.accept all never ;; reload")

config.bind("tbh", "config-cycle -p -t -u *://{url:host}/* content.blocking.enabled ;; reload")
config.bind("tBh", "config-cycle -p -u *://{url:host}/* content.blocking.enabled ;; reload")
config.bind("tbH", "config-cycle -p -t -u *://*.{url:host}/* content.blocking.enabled ;; reload")
config.bind("tBH", "config-cycle -p -u *://*.{url:host}/* content.blocking.enabled ;; reload")
config.bind("tbu", "config-cycle -p -t -u {url} content.blocking.enabled ;; reload")
config.bind("tBu", "config-cycle -p -u {url} content.blocking.enabled ;; reload")

# rebinds
config.bind("q", "close")
config.bind("m", "tab-mute")

# leader binds
leader = "<Space>"
config.bind(leader + leader, "fake-key " + leader)
config.bind(leader + "v", "hint links spawn --detach mpv {hint-url}")
config.bind(leader + "V", "spawn --detach mpv {url}")
config.bind(leader + "d", "hint links spawn --detach ytfzf --download=1 '{hint-url}'")
config.bind(leader + "D", "spawn --detach ytfzf --download=1 '{url}'")
config.bind(leader + "c", "hint links spawn --detach chromium '{hint-url}'")
config.bind(leader + "C", "spawn --detach chromium '{url}'")
config.bind(leader + "f", "hint links spawn --detach firefox '{hint-url}'")
config.bind(leader + "F", "spawn --detach firefox '{url}'")

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

# load autoconfig.yml
config.load_autoconfig(True)
