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
c.fonts.web.size.minimum    = 14
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

# enable
config.bind("esh", "set -p -t -u *://{url:host}/* content.javascript.enabled true ;; reload")
config.bind("eSh", "set -p -u *://{url:host}/* content.javascript.enabled true ;; reload")
config.bind("esH", "set -p -t -u *://*.{url:host}/* content.javascript.enabled true ;; reload")
config.bind("eSH", "set -p -u *://*.{url:host}/* content.javascript.enabled true ;; reload")
config.bind("esu", "set -p -t -u {url} content.javascript.enabled true ;; reload")
config.bind("eSu", "set -p -u {url} content.javascript.enabled true ;; reload")

config.bind("ech", "set -p -t -u *://{url:host}/* content.cookies.accept no-3rdparty ;; reload")
config.bind("eCh", "set -p -u *://{url:host}/* content.cookies.accept no-3rdparty ;; reload")
config.bind("ecH", "set -p -t -u *://*.{url:host}/* content.cookies.accept no-3rdparty ;; reload")
config.bind("eCH", "set -p -u *://*.{url:host}/* content.cookies.accept no-3rdparty ;; reload")
config.bind("ecu", "set -p -t -u {url} content.cookies.accept no-3rdparty ;; reload")
config.bind("eCu", "set -p -u {url} content.cookies.accept no-3rdparty ;; reload")

config.bind("ecah", "set -p -t -u *://{url:host}/* content.cookies.accept all ;; reload")
config.bind("eCah", "set -p -u *://{url:host}/* content.cookies.accept all ;; reload")
config.bind("ecaH", "set -p -t -u *://*.{url:host}/* content.cookies.accept all ;; reload")
config.bind("eCaH", "set -p -u *://*.{url:host}/* content.cookies.accept all ;; reload")
config.bind("ecau", "set -p -t -u {url} content.cookies.accept all ;; reload")
config.bind("eCau", "set -p -u {url} content.cookies.accept all ;; reload")

config.bind("ebh", "set -p -t -u *://{url:host}/* content.blocking.enabled true ;; reload")
config.bind("eBh", "set -p -u *://{url:host}/* content.blocking.enabled true ;; reload")
config.bind("ebH", "set -p -t -u *://*.{url:host}/* content.blocking.enabled true ;; reload")
config.bind("eBH", "set -p -u *://*.{url:host}/* content.blocking.enabled true ;; reload")
config.bind("ebu", "set -p -t -u {url} content.blocking.enabled true ;; reload")
config.bind("eBu", "set -p -u {url} content.blocking.enabled true ;; reload")

config.bind("eih", "set -p -t -u *://{url:host}/* content.images true ;; reload")
config.bind("eIh", "set -p -u *://{url:host}/* content.images true ;; reload")
config.bind("eiH", "set -p -t -u *://*.{url:host}/* content.images true ;; reload")
config.bind("eIH", "set -p -u *://*.{url:host}/* content.images true ;; reload")
config.bind("eiu", "set -p -t -u {url} content.images true ;; reload")
config.bind("eIu", "set -p -u {url} content.images true ;; reload")

config.bind("eph", "set -p -t -u *://{url:host}/* content.plugins true ;; reload")
config.bind("ePh", "set -p -u *://{url:host}/* content.plugins true ;; reload")
config.bind("epH", "set -p -t -u *://*.{url:host}/* content.plugins true ;; reload")
config.bind("ePH", "set -p -u *://*.{url:host}/* content.plugins true ;; reload")
config.bind("epu", "set -p -t -u {url} content.plugins true ;; reload")
config.bind("ePu", "set -p -u {url} content.plugins true ;; reload")

# disable
config.unbind("d")
config.bind("dsh", "set -p -t -u *://{url:host}/* content.javascript.enabled false ;; reload")
config.bind("dSh", "set -p -u *://{url:host}/* content.javascript.enabled false ;; reload")
config.bind("dsH", "set -p -t -u *://*.{url:host}/* content.javascript.enabled false ;; reload")
config.bind("dSH", "set -p -u *://*.{url:host}/* content.javascript.enabled false ;; reload")
config.bind("dsu", "set -p -t -u {url} content.javascript.enabled false ;; reload")
config.bind("dSu", "set -p -u {url} content.javascript.enabled false ;; reload")

config.bind("dch", "set -p -t -u *://{url:host}/* content.cookies.accept never ;; reload")
config.bind("dCh", "set -p -u *://{url:host}/* content.cookies.accept never ;; reload")
config.bind("dcH", "set -p -t -u *://*.{url:host}/* content.cookies.accept never ;; reload")
config.bind("dCH", "set -p -u *://*.{url:host}/* content.cookies.accept never ;; reload")
config.bind("dcu", "set -p -t -u {url} content.cookies.accept never ;; reload")
config.bind("dCu", "set -p -u {url} content.cookies.accept never ;; reload")

config.bind("dbh", "set -p -t -u *://{url:host}/* content.blocking.enabled false ;; reload")
config.bind("dBh", "set -p -u *://{url:host}/* content.blocking.enabled false ;; reload")
config.bind("dbH", "set -p -t -u *://*.{url:host}/* content.blocking.enabled false ;; reload")
config.bind("dBH", "set -p -u *://*.{url:host}/* content.blocking.enabled false ;; reload")
config.bind("dbu", "set -p -t -u {url} content.blocking.enabled false ;; reload")
config.bind("dBu", "set -p -u {url} content.blocking.enabled false ;; reload")

config.bind("dih", "set -p -t -u *://{url:host}/* content.images false ;; reload")
config.bind("dIh", "set -p -u *://{url:host}/* content.images false ;; reload")
config.bind("diH", "set -p -t -u *://*.{url:host}/* content.images false ;; reload")
config.bind("dIH", "set -p -u *://*.{url:host}/* content.images false ;; reload")
config.bind("diu", "set -p -t -u {url} content.images false ;; reload")
config.bind("dIu", "set -p -u {url} content.images false ;; reload")

config.bind("dph", "set -p -t -u *://{url:host}/* content.plugins false ;; reload")
config.bind("dPh", "set -p -u *://{url:host}/* content.plugins false ;; reload")
config.bind("dpH", "set -p -t -u *://*.{url:host}/* content.plugins false ;; reload")
config.bind("dPH", "set -p -u *://*.{url:host}/* content.plugins false ;; reload")
config.bind("dpu", "set -p -t -u {url} content.plugins false ;; reload")
config.bind("dPu", "set -p -u {url} content.plugins false ;; reload")

# rebinds
config.bind("q", "close")
config.bind("O", "set-cmd-text -s :open -w")
config.bind("m", "tab-mute")

# leader binds
leader = "<Space>"
config.bind(leader + leader, "fake-key " + leader)
config.bind(leader + "o", "set-cmd-text -s :open -p")
config.bind(leader + "vv", "hint links spawn --detach mpv {hint-url}")
config.bind(leader + "vr", "hint -r links spawn --detach mpv {hint-url}")
config.bind(leader + "vu", "spawn --detach mpv {url}")
config.bind(leader + "dd", "hint links spawn --detach ytfzf --download=1 '{hint-url}'")
config.bind(leader + "dr", "hint -r links spawn --detach ytfzf --download=1 '{hint-url}'")
config.bind(leader + "du", "spawn --detach ytfzf --download=1 '{url}'")
config.bind(leader + "cc", "hint links spawn --detach chromium '{hint-url}'")
config.bind(leader + "cr", "hint -r links spawn --detach chromium '{hint-url}'")
config.bind(leader + "cu", "spawn --detach chromium '{url}'")
config.bind(leader + "ff", "hint links spawn --detach firefox '{hint-url}'")
config.bind(leader + "fr", "hint -r links spawn --detach firefox '{hint-url}'")
config.bind(leader + "fu", "spawn --detach firefox '{url}'")

# ==================== Search Engines ====================================
c.url.searchengines = {
    'DEFAULT': 'https://search.simonhugh.xyz/searx/search?q={}',
    # DuckDuckGO
    'd': 'https://duckduckgo.com/?q={}',
    # Google
    'g' :  'http://www.google.com/search?q={}',
    # Google Maps
    'm' :  'https://www.google.com/maps/search/{}',
    # Youtube
    'y' : 'https://www.youtube.com/results?search_query={}',
    # Amazon
    'a' : 'https://www.amazon.co.uk/s?k={}',
}

# load autoconfig.yml
config.load_autoconfig(True)
