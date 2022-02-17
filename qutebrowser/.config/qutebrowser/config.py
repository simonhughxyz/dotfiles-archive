# 
# Qutebrowser Config
# 
from cconfig import CConfig

# Custom state full config options
cc = CConfig(config)
cc.redirect = True

# ==================== General Settings ==================================
c.confirm_quit              = ['downloads']
c.content.fullscreen.window = True
c.spellcheck.languages      = ["de-DE", "en-GB", "en-US"]
c.tabs.show                 = 'never'
c.tabs.tabs_are_windows     = True
c.new_instance_open_target  = 'window'
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
    'qr': 'spawn --userscript qr',
}

# ==================== Bindings ==========================================

# Javascript
config.bind('ess', 'set -p -t content.javascript.enabled true ;; reload')
config.bind('eSs', 'set -p content.javascript.enabled true ;; reload')
config.bind('esh', 'set -p -t -u *://{url:host}/* content.javascript.enabled true ;; reload')
config.bind('eSh', 'set -p -u *://{url:host}/* content.javascript.enabled true ;; reload')
config.bind('esH', 'set -p -t -u *://*.{url:host}/* content.javascript.enabled true ;; reload')
config.bind('eSH', 'set -p -u *://*.{url:host}/* content.javascript.enabled true ;; reload')
config.bind('esu', 'set -p -t -u {url} content.javascript.enabled true ;; reload')
config.bind('eSu', 'set -p -u {url} content.javascript.enabled true ;; reload')

config.unbind('d')
config.bind('dss', 'set -p -t content.javascript.enabled false ;; reload')
config.bind('dSs', 'set -p content.javascript.enabled false ;; reload')
config.bind('dsh', 'set -p -t -u *://{url:host}/* content.javascript.enabled false ;; reload')
config.bind('dSh', 'set -p -u *://{url:host}/* content.javascript.enabled false ;; reload')
config.bind('dsH', 'set -p -t -u *://*.{url:host}/* content.javascript.enabled false ;; reload')
config.bind('dSH', 'set -p -u *://*.{url:host}/* content.javascript.enabled false ;; reload')
config.bind('dsu', 'set -p -t -u {url} content.javascript.enabled false ;; reload')
config.bind('dSu', 'set -p -u {url} content.javascript.enabled false ;; reload')

config.bind('tss', 'config-cycle -p -t content.javascript.enabled ;; reload')
config.bind('tSs', 'config-cycle -p content.javascript.enabled ;; reload')

# Cookies
config.bind('ecc', 'set -p -t content.cookies.accept no-3rdparty ;; reload')
config.bind('eCc', 'set -p content.cookies.accept no-3rdparty ;; reload')
config.bind('ech', 'set -p -t -u *://{url:host}/* content.cookies.accept no-3rdparty ;; reload')
config.bind('eCh', 'set -p -u *://{url:host}/* content.cookies.accept no-3rdparty ;; reload')
config.bind('ecH', 'set -p -t -u *://*.{url:host}/* content.cookies.accept no-3rdparty ;; reload')
config.bind('eCH', 'set -p -u *://*.{url:host}/* content.cookies.accept no-3rdparty ;; reload')
config.bind('ecu', 'set -p -t -u {url} content.cookies.accept no-3rdparty ;; reload')
config.bind('eCu', 'set -p -u {url} content.cookies.accept no-3rdparty ;; reload')

config.bind('ecac', 'set -p -t content.cookies.accept all ;; reload')
config.bind('eCac', 'set -p content.cookies.accept all ;; reload')
config.bind('ecah', 'set -p -t -u *://{url:host}/* content.cookies.accept all ;; reload')
config.bind('eCah', 'set -p -u *://{url:host}/* content.cookies.accept all ;; reload')
config.bind('ecaH', 'set -p -t -u *://*.{url:host}/* content.cookies.accept all ;; reload')
config.bind('eCaH', 'set -p -u *://*.{url:host}/* content.cookies.accept all ;; reload')
config.bind('ecau', 'set -p -t -u {url} content.cookies.accept all ;; reload')
config.bind('eCau', 'set -p -u {url} content.cookies.accept all ;; reload')

config.bind('dcc', 'set -p -t content.cookies.accept never ;; reload')
config.bind('dCc', 'set -p content.cookies.accept never ;; reload')
config.bind('dch', 'set -p -t -u *://{url:host}/* content.cookies.accept never ;; reload')
config.bind('dCh', 'set -p -u *://{url:host}/* content.cookies.accept never ;; reload')
config.bind('dcH', 'set -p -t -u *://*.{url:host}/* content.cookies.accept never ;; reload')
config.bind('dCH', 'set -p -u *://*.{url:host}/* content.cookies.accept never ;; reload')
config.bind('dcu', 'set -p -t -u {url} content.cookies.accept never ;; reload')
config.bind('dCu', 'set -p -u {url} content.cookies.accept never ;; reload')

config.bind('tcc', 'config-cycle -p -t content.cookies.accept no-3rdparty never ;; reload')
config.bind('tCc', 'config-cycle -p content.cookies.accept no-3rdparty never ;; reload')
config.bind('tch', 'config-cycle -p -t -u *://{url:host}/* content.cookies.accept no-3rdparty never ;; reload')
config.bind('tCh', 'config-cycle -p -u *://{url:host}/* content.cookies.accept no-3rdparty never ;; reload')
config.bind('tcH', 'config-cycle -p -t -u *://*.{url:host}/* content.cookies.accept no-3rdparty never ;; reload')
config.bind('tCH', 'config-cycle -p -u *://*.{url:host}/* content.cookies.accept no-3rdparty never ;; reload')
config.bind('tcu', 'config-cycle -p -t -u {url} content.cookies.accept no-3rdparty never ;; reload')
config.bind('tCu', 'config-cycle -p -u {url} content.cookies.accept no-3rdparty never ;; reload')

config.bind('tcac', 'config-cycle -p -t content.cookies.accept all never ;; reload')
config.bind('tCac', 'config-cycle -p content.cookies.accept all never ;; reload')
config.bind('tcah', 'config-cycle -p -t -u *://{url:host}/* content.cookies.accept all never ;; reload')
config.bind('tCah', 'config-cycle -p -u *://{url:host}/* content.cookies.accept all never ;; reload')
config.bind('tcaH', 'config-cycle -p -t -u *://*.{url:host}/* content.cookies.accept all never ;; reload')
config.bind('tCaH', 'config-cycle -p -u *://*.{url:host}/* content.cookies.accept all never ;; reload')
config.bind('tcau', 'config-cycle -p -t -u {url} content.cookies.accept all never ;; reload')
config.bind('tCau', 'config-cycle -p -u {url} content.cookies.accept all never ;; reload')

# AdBlocker
config.bind('ebb', 'set -p -t content.blocking.enabled true ;; reload')
config.bind('eBb', 'set -p content.blocking.enabled true ;; reload')
config.bind('ebh', 'set -p -t -u *://{url:host}/* content.blocking.enabled true ;; reload')
config.bind('eBh', 'set -p -u *://{url:host}/* content.blocking.enabled true ;; reload')
config.bind('ebH', 'set -p -t -u *://*.{url:host}/* content.blocking.enabled true ;; reload')
config.bind('eBH', 'set -p -u *://*.{url:host}/* content.blocking.enabled true ;; reload')
config.bind('ebu', 'set -p -t -u {url} content.blocking.enabled true ;; reload')
config.bind('eBu', 'set -p -u {url} content.blocking.enabled true ;; reload')

config.bind('dbb', 'set -p -t content.blocking.enabled false ;; reload')
config.bind('dBb', 'set -p content.blocking.enabled false ;; reload')
config.bind('dbh', 'set -p -t -u *://{url:host}/* content.blocking.enabled false ;; reload')
config.bind('dBh', 'set -p -u *://{url:host}/* content.blocking.enabled false ;; reload')
config.bind('dbH', 'set -p -t -u *://*.{url:host}/* content.blocking.enabled false ;; reload')
config.bind('dBH', 'set -p -u *://*.{url:host}/* content.blocking.enabled false ;; reload')
config.bind('dbu', 'set -p -t -u {url} content.blocking.enabled false ;; reload')
config.bind('dBu', 'set -p -u {url} content.blocking.enabled false ;; reload')

config.bind('tbb', 'config-cycle -p -t content.blocking.enabled ;; reload')
config.bind('tBb', 'config-cycle -p content.blocking.enabled ;; reload')
config.bind('tbh', 'config-cycle -p -t -u *://{url:host}/* content.blocking.enabled ;; reload')
config.bind('tBh', 'config-cycle -p -u *://{url:host}/* content.blocking.enabled ;; reload')
config.bind('tbH', 'config-cycle -p -t -u *://*.{url:host}/* content.blocking.enabled ;; reload')
config.bind('tBH', 'config-cycle -p -u *://*.{url:host}/* content.blocking.enabled ;; reload')
config.bind('tbu', 'config-cycle -p -t -u {url} content.blocking.enabled ;; reload')
config.bind('tBu', 'config-cycle -p -u {url} content.blocking.enabled ;; reload')

# Images
config.bind('eii', 'set -p -t content.images true ;; reload')
config.bind('eIi', 'set -p content.images true ;; reload')
config.bind('eih', 'set -p -t -u *://{url:host}/* content.images true ;; reload')
config.bind('eIh', 'set -p -u *://{url:host}/* content.images true ;; reload')
config.bind('eiH', 'set -p -t -u *://*.{url:host}/* content.images true ;; reload')
config.bind('eIH', 'set -p -u *://*.{url:host}/* content.images true ;; reload')
config.bind('eiu', 'set -p -t -u {url} content.images true ;; reload')
config.bind('eIu', 'set -p -u {url} content.images true ;; reload')

config.bind('dii', 'set -p -t content.images false ;; reload')
config.bind('dIi', 'set -p content.images false ;; reload')
config.bind('dih', 'set -p -t -u *://{url:host}/* content.images false ;; reload')
config.bind('dIh', 'set -p -u *://{url:host}/* content.images false ;; reload')
config.bind('diH', 'set -p -t -u *://*.{url:host}/* content.images false ;; reload')
config.bind('dIH', 'set -p -u *://*.{url:host}/* content.images false ;; reload')
config.bind('diu', 'set -p -t -u {url} content.images false ;; reload')
config.bind('dIu', 'set -p -u {url} content.images false ;; reload')

# Plugins
config.bind('epp', 'set -p -t content.plugins true ;; reload')
config.bind('ePp', 'set -p content.plugins true ;; reload')
config.bind('eph', 'set -p -t -u *://{url:host}/* content.plugins true ;; reload')
config.bind('ePh', 'set -p -u *://{url:host}/* content.plugins true ;; reload')
config.bind('epH', 'set -p -t -u *://*.{url:host}/* content.plugins true ;; reload')
config.bind('ePH', 'set -p -u *://*.{url:host}/* content.plugins true ;; reload')
config.bind('epu', 'set -p -t -u {url} content.plugins true ;; reload')
config.bind('ePu', 'set -p -u {url} content.plugins true ;; reload')

config.bind('dpp', 'set -p -t content.plugins false ;; reload')
config.bind('dPp', 'set -p content.plugins false ;; reload')
config.bind('dph', 'set -p -t -u *://{url:host}/* content.plugins false ;; reload')
config.bind('dPh', 'set -p -u *://{url:host}/* content.plugins false ;; reload')
config.bind('dpH', 'set -p -t -u *://*.{url:host}/* content.plugins false ;; reload')
config.bind('dPH', 'set -p -u *://*.{url:host}/* content.plugins false ;; reload')
config.bind('dpu', 'set -p -t -u {url} content.plugins false ;; reload')
config.bind('dPu', 'set -p -u {url} content.plugins false ;; reload')

# Tor proxy
config.bind('et', 'set -p -t content.proxy socks://127.0.0.1:9050')
config.bind('dt', 'set -p -t content.proxy none')
config.bind('tt', 'config-cycle -p -t content.proxy none socks://127.0.0.1:9050')

# Mute
config.bind('emm', 'set -p -t content.mute true')
config.bind('eMm', 'set -p content.mute true')
config.bind('emh', 'set -p -t -u *://{url:host}/* content.mute true')
config.bind('eMh', 'set -p -u *://{url:host}/* content.mute true')
config.bind('emH', 'set -p -t -u *://*.{url:host}/* content.mute true')
config.bind('eMH', 'set -p -u *://*.{url:host}/* content.mute true')
config.bind('emu', 'set -p -t -u {url} content.mute true')
config.bind('eMu', 'set -p -u {url} content.mute true')

config.bind('dmm', 'set -p -t content.mute false')
config.bind('dMm', 'set -p content.mute false')
config.bind('dmh', 'set -p -t -u *://{url:host}/* content.mute false')
config.bind('dMh', 'set -p -u *://{url:host}/* content.mute false')
config.bind('dmH', 'set -p -t -u *://*.{url:host}/ content.mute false')
config.bind('dMH', 'set -p -u *://*.{url:host}/* content.mute false')
config.bind('dmu', 'set -p -t -u {url} content.mute false')
config.bind('dMu', 'set -p -u {url} content.mute false')

config.bind('tmm', 'config-cycle -p -t content.mute')
config.bind('tMm', 'config-cycle -p content.mute')
config.bind('tmh', 'config-cycle -p -t -u *://{url:host}/* content.mute')
config.bind('tMh', 'config-cycle -p -u *://{url:host}/* content.mute')
config.bind('tmH', 'config-cycle -p -t -u *://*.{url:host}/* content.mute')
config.bind('tMH', 'config-cycle -p -u *://*.{url:host}/* content.mute')
config.bind('tmu', 'config-cycle -p -t -u {url} content.mute')
config.bind('tMu', 'config-cycle -p -u {url} content.mute')

# Local Storage
config.bind('ell', 'set -p -t content.local_storage true ;; reload')
config.bind('eLl', 'set -p content.local_storage true ;; reload')
config.bind('elh', 'set -p -t -u *://{url:host}/* content.local_storage true ;; reload')
config.bind('eLh', 'set -p -u *://{url:host}/* content.local_storage true ;; reload')
config.bind('elH', 'set -p -t -u *://*.{url:host}/* content.local_storage true ;; reload')
config.bind('eLH', 'set -p -u *://*.{url:host}/* content.local_storage true ;; reload')
config.bind('elu', 'set -p -t -u {url} content.local_storage true ;; reload')
config.bind('eLu', 'set -p -u {url} content.local_storage true ;; reload')

config.bind('dll', 'set -p -t content.local_storage false ;; reload')
config.bind('dLl', 'set -p content.local_storage false ;; reload')
config.bind('dlh', 'set -p -t -u *://{url:host}/* content.local_storage false ;; reload')
config.bind('dLh', 'set -p -u *://{url:host}/* content.local_storage false ;; reload')
config.bind('dlH', 'set -p -t -u *://*.{url:host}/ content.local_storage false ;; reload')
config.bind('dLH', 'set -p -u *://*.{url:host}/* content.local_storage false ;; reload')
config.bind('dlu', 'set -p -t -u {url} content.local_storage false ;; reload')
config.bind('dLu', 'set -p -u {url} content.local_storage false ;; reload')

config.bind('tll', 'config-cycle -p -t content.local_storage ;; reload')
config.bind('tLl', 'config-cycle -p content.local_storage ;; reload')
config.bind('tlh', 'config-cycle -p -t -u *://{url:host}/* content.local_storage ;; reload')
config.bind('tLh', 'config-cycle -p -u *://{url:host}/* content.local_storage ;; reload')
config.bind('tlH', 'config-cycle -p -t -u *://*.{url:host}/* content.local_storage ;; reload')
config.bind('tLH', 'config-cycle -p -u *://*.{url:host}/* content.local_storage ;; reload')
config.bind('tlu', 'config-cycle -p -t -u {url} content.local_storage ;; reload')
config.bind('tLu', 'config-cycle -p -u {url} content.local_storage ;; reload')

# redirect
config.bind('er', 'spawn --userscript redirect True')
config.bind('dr', 'spawn --userscript redirect False')

# rebinds
config.bind('q', 'close')
config.bind('O', 'set-cmd-text -s :open -w')
config.bind('F', 'hint all window ')
config.bind('I', 'hint -f inputs normal ')
config.bind('m', 'tab-mute')
# config.bind('<Escape>', 'mode-leave ;; jseval -q document.activeElement.blur()', mode='insert')
config.bind('<Ctrl+Escape>', 'fake-key <Escape>')

# leader binds
leader = '<Space>'
config.bind(leader + leader, 'fake-key ' + leader)
config.bind(leader + 'o', 'set-cmd-text -s :open -p')
config.bind(leader + 'vv', 'hint links spawn --detach mpv "{hint-url}"')
config.bind(leader + 'vr', 'hint -r links spawn --detach mpv "{hint-url}"')
config.bind(leader + 'vu', 'spawn --detach mpv "{url}"')
config.bind(leader + 'dd', 'hint links spawn ytdl "{hint-url}"')
config.bind(leader + 'dr', 'hint -r links spawn --detach ytdl "{hint-url}"')
config.bind(leader + 'du', 'spawn --detach ytdl "{url}"')
config.bind(leader + 'ii', 'hint images spawn --detach img -u "{hint-url}"')
config.bind(leader + 'ir', 'hint -r images spawn --detach img -u "{hint-url}"')
config.bind(leader + 'iu', 'spawn --detach img -u "{url}"')
config.bind(leader + 'cc', 'hint links spawn --detach chromium "{hint-url}"')
config.bind(leader + 'cr', 'hint -r links spawn --detach chromium "{hint-url}"')
config.bind(leader + 'cu', 'spawn --detach chromium "{url}"')
config.bind(leader + 'ff', 'hint links spawn --detach firefox "{hint-url}"')
config.bind(leader + 'fr', 'hint -r links spawn --detach firefox "{hint-url}"')
config.bind(leader + 'fu', 'spawn --detach firefox "{url}"')
config.bind(leader + 'tt', 'hint links spawn --detach tm -a "{hint-url}"')
config.bind(leader + 'tr', 'hint -r links spawn --detach tm -a "{hint-url}"')
config.bind(leader + 'tu', 'spawn --detach tm -a "{url}"')
config.bind(leader + 'qq', 'hint links userscript qr')
config.bind(leader + 'qu', 'spawn --userscript qr')
config.bind(leader + 'qr', 'hint -r links userscript qr')

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

# redirect urls
config.source('redirect.py')

# load autoconfig.yml
config.load_autoconfig(True)
