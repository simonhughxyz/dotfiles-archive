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

# ==================== Aliases ===========================================
c.aliases = {
    'w': 'session-save',
    'q': 'quit',
    'wq': 'quit --save',
}

# ==================== Bindings ==========================================
config.bind("v", "hint links spawn mpv {hint-url}")
config.bind("d", "hint links spawn ytfzf --download=1 '{hint-url}'")

