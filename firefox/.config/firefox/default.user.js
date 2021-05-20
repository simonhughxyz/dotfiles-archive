//
// #### HARD.USER.JS ####
//
//  This user js has very strict privacy protecting settings which may break
//  some websites
//
// All settings in this file will overide about:config settings.

//
// UI SETTINGS
//

user_pref("browser.tabs.drawInTitlebar", false);

user_pref("browser.uidensity", 1);

user_pref("browser.uiCustomization.state",{"placements":{"widget-overflow-fixed-list":["_testpilot-containers-browser-action","cookieautodelete_kennydo_com-browser-action","ublock0_raymondhill_net-browser-action","https-everywhere_eff_org-browser-action","_7a7a4a92-a2a0-41d1-9fd7-1e92480d612d_-browser-action"],"nav-bar":["back-button","forward-button","urlbar-container","downloads-button","umatrix_raymondhill_net-browser-action","_a655a6b2-69a5-40de-a3b8-3f7f200c95a7_-browser-action","jid1-qofqdk4qzufgwq_jetpack-browser-action"],"toolbar-menubar":["menubar-items"],"TabsToolbar":["tabbrowser-tabs","alltabs-button"],"PersonalToolbar":["personal-bookmarks"]},"seen":["developer-button","ublock0_raymondhill_net-browser-action","umatrix_raymondhill_net-browser-action","_7a7a4a92-a2a0-41d1-9fd7-1e92480d612d_-browser-action","_a655a6b2-69a5-40de-a3b8-3f7f200c95a7_-browser-action","https-everywhere_eff_org-browser-action","jid1-qofqdk4qzufgwq_jetpack-browser-action","_testpilot-containers-browser-action","cookieautodelete_kennydo_com-browser-action"],"dirtyAreaCache":["nav-bar","toolbar-menubar","TabsToolbar","PersonalToolbar","widget-overflow-fixed-list"],"currentVersion":16,"newElementCount":6});

// Set start page
// 0 = blank.
// 1 = home.
// 2 = last visited page.
// 3 = resume previous session.
user_pref("browser.startup.page", 0);
user_pref("startup.homepage_welcome_url", "");

// Set Home/New Window page.
user_pref("browser.startup.homepage", "about:blank");

// Disable NewTab page.
user_pref("browser.newtabpage.enabled", false);
user_pref("browser.newtab.preload", false);
user_pref("browser.newtabpage.activity-stream.discoverystream.enabled", false);
user_pref("browser.newtabpage.activity-stream.feeds.section.highlights", false);
user_pref("browser.newtabpage.activity-stream.feeds.snippets", false);
user_pref("browser.newtabpage.activity-stream.feeds.topsites", false);
user_pref("browser.newtabpage.activity-stream.showSearch", false);

// Don't trim HTTP off of URLs in the address bar.
user_pref("browser.urlbar.trimURLs", false);

// Don't show bookmark icons
user_pref("browser.chrome.site_icons", false);

// Enable dark theme
user_pref("browser.in-content.dark-mode", true);
user_pref("ui.systemUsesDarkTheme", 1);

// Fonts
user_pref("browser.display.use_document_fonts", 0);
user_pref("font.internaluseonly.changed", false);
user_pref("font.minimum-size.x-western", 16);
user_pref("font.name.monospace.x-western", "monospace");
user_pref("font.name.sans-serif.x-western", "SauceCodePro Nerd Font");
user_pref("font.name.serif.x-western", "serif");
user_pref("font.size.monospace.x-western", 18);

// Left mouse opens in current window
user_pref("browser.link.open_newwindow", 2);
user_pref("browser.link.open_newwindow.restriction", 0);
user_pref("browser.link.open_newwindow.override.external", 2);

// Middle Mouse opens in new window.
user_pref("middlemouse.contentLoadURL", false);
user_pref("browser.tabs.opentabfor.middleclick", false);
user_pref("middlemouse.openNewWindow", true);


// MISC

user_pref("browser.privatebrowsing.autostart", false); // Always private mode
user_pref("browser.aboutConfig.showWarning", false); // Disable modify warning
user_pref("general.warnOnAboutConfig", false); // XUL/XHTML version
user_pref("browser.shell.checkDefaultBrowser", false); // Disable default check
user_pref("dom.ipc.processCount", 16); // Double process count
user_pref("findbar.highlightAll", true); // Highlight text search
user_pref("general.smoothScroll", false); // Smooth scrolling off
user_pref("reader.parse-on-load.enabled", false); // Disable reader
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
user_pref("network.protocol-handler.external.http", false);
user_pref("network.protocol-handler.external.https", false);
user_pref("network.protocol-handler.external.javascript", false);
user_pref("network.protocol-handler.external.moz-extension", false);
user_pref("network.protocol-handler.external.ftp", false);
user_pref("network.protocol-handler.external.file", false);
user_pref("network.protocol-handler.external.about", false);
user_pref("network.protocol-handler.external.chrome", false);
user_pref("network.protocol-handler.external.blob", false);
user_pref("network.protocol-handler.external.data", false);
user_pref("network.protocol-handler.expose-all", false);
user_pref("network.protocol-handler.expose.http", true);
user_pref("network.protocol-handler.expose.https", true);
user_pref("network.protocol-handler.expose.javascript", true);
user_pref("network.protocol-handler.expose.moz-extension", true);
user_pref("network.protocol-handler.expose.ftp", true);
user_pref("network.protocol-handler.expose.file", true);
user_pref("network.protocol-handler.expose.about", true);
user_pref("network.protocol-handler.expose.chrome", true);
user_pref("network.protocol-handler.expose.blob", true);
user_pref("network.protocol-handler.expose.data", true);

// Save session every x milliseconds.
user_pref("browser.sessionstore.interval", 60000);


user_pref("view_source.editor.external", true);
user_pref("view_source.editor.path", "xst -e nvim");

//
// ANTI FEATURES
//


user_pref("accessibility.force_disabled", 1);
user_pref("extensions.formautofill.available", "off"); // Disable autofill
user_pref("extensions.screenshots.disabled", true); // Disable screenshots
user_pref("extensions.webcompat-reporter.enabled", false); // Disable report this site
user_pref("identity.fxaccounts.enabled", true); // Disable Fx accounts
user_pref("browser.messaging-system.whatsNewPanel.enabled", false); // Remove whats new

// Don't check for updates (My package manager handles that).
user_pref("app.update.enabled", false);
user_pref("app.update.auto", false);

// Disable pocket.
user_pref("browser.pocket.enabled", false);
user_pref("extensions.pocket.enabled", false);
user_pref("browser.newtabpage.activity-stream.feeds.section.topstories", false);

// Disable OpenH264 for WebRTC
user_pref("media.gmp-gmpopenh264.enabled", false);
user_pref("media.gmp-manager.url", "");
user_pref("media.gmp-provider.enabled", false);

user_pref("pdfjs.disabled", true); // Disable built in pdf viewer
user_pref("signon.rememberSignons", false); // Disable password manager
user_pref("signon.autofillForms", false);   // Do not autofil passwords
user_pref("browser.formfill.enable", false); // Disable form autofill.
user_pref("toolkit.cosmeticAnimations.enabled", false); // Disable unnecessary browser animations.
user_pref("dom.webnotifications.enabled", false); // Disable Web notifications
user_pref("media.videocontrols.picture-in-picture.enabled", false); // Disable picture in picture
user_pref("media.videocontrols.picture-in-picture.video-toggle.enabled", false); // Disable picture in picture button
user_pref("browser.urlbar.suggest.searches", false); // Dont suggest searches in url bar.
user_pref("media.autoplay.default", 1); // Pause media by default

// Disable recommendations
user_pref("extensions.htmlaboutaddons.recommendations.enabled", false);
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr", false);
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons", false);
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features", false);

// Disable right click hijacking
// Alternative: Use shift+click.
user_pref("dom.event.contextmenu.enabled", false);

// Don't allow websites from moving or resizing windows
// This setting works well with tiling window managers.
user_pref("dom.disable_window_move_resize", true);

// Don't allow websites from modifying window ui
user_pref("dom.disable_window_open_feature.close", true);
user_pref("dom.disable_window_open_feature.location", true);
user_pref("dom.disable_window_open_feature.menubar", true);
user_pref("dom.disable_window_open_feature.minimizable", true);
user_pref("dom.disable_window_open_feature.personalbar", true);
user_pref("dom.disable_window_open_feature.resizable", true);
user_pref("dom.disable_window_open_feature.status", true);
user_pref("dom.disable_window_open_feature.titlebar", true);
user_pref("dom.disable_window_open_feature.toolbar", true);
user_pref("dom.disable_window_open_feature.scrollbars", true);
user_pref("dom.disable_window_status_change", true);

// PROXY SETTINGS
user_pref("network.proxy.autoconfig_url", "file:///etc/proxy.pac");
user_pref("network.proxy.type", 2);
user_pref("network.proxy.socks_remote_dns", true);
user_pref("network.dns.blockDotOnion", false);

// Performance and memory

// Amount of cache to store in memory in kb.
user_pref("browser.cache.memory.enable", true);
user_pref("browser.cache.memory.capacity", 102400);
user_pref("browser.cache.disk.enable", false);
user_pref("browser.cache.offline.enable", false);

// Number of pages each tab stores in its back/forward history.
user_pref("browser.sessionhistory.max_entries", 20);

// Number of pages stored in memory so they don't have to be re-parsed. 
user_pref("browser.sessionhistory.max_total_viewers", 16);

// SECURITY & PRIVACY

// Google Safe Browsing
// Prevents Firefox from sending information about downloaded executable files to Google Safe Browsing to determine whether it should be blocked for safety reasons.
user_pref("browser.safebrowsing.downloads.remote.enabled", false);
user_pref("browser.safebrowsing.downloads.enabled", false);
user_pref("browser.safebrowsing.malware.enabled", false);
user_pref("browser.safebrowsing.phishing.enabled", false);
user_pref("browser.safebrowsing.provider.mozilla.gethashURL", "");
user_pref("browser.safebrowsing.provider.mozilla.updateURL", "");

// Default permissions.
user_pref("permissions.default.camera", 2);
user_pref("permissions.default.desktop-notification", 2);
user_pref("permissions.default.geo", 2);
user_pref("permissions.default.microphone", 2);
user_pref("permissions.default.xr", 2);
user_pref("permissions.default.image", 1);
user_pref("permissions.default.shortcuts", 0);

// Clear History and cache
user_pref("privacy.sanitize.sanitizeOnShutdown", true);
user_pref("privacy.clearOnShutdown.cache", true);
user_pref("privacy.clearOnShutdown.cookies", false); // Handled by cookie auto delete
user_pref("privacy.clearOnShutdown.downloads", true);
user_pref("privacy.clearOnShutdown.formdata", true);
user_pref("privacy.clearOnShutdown.history", true);
user_pref("privacy.clearOnShutdown.offlineApps", true);
user_pref("privacy.clearOnShutdown.sessions", true);
user_pref("privacy.clearOnShutdown.openWindows", true);


// Device Fingerprinting
user_pref("beacon.enabled", false); // Disable beacon
user_pref("dom.battery.enabled", false); // Disable battery status
user_pref("dom.event.clipboardevents.enabled", false); // Disable clipboard events
user_pref("dom.gamepad.enabled", false); // Disable USB devices
user_pref("dom.push.enabled", false); // Disable push service
user_pref("geo.enabled", false); // Disable geolocation
user_pref("geo.provider.network.url", "");
user_pref("media.navigator.enabled", false); // Disable mic and camera
user_pref("media.peerconnection.enabled", false); // Disable WebRTC
user_pref("media.webspeech.synth.enabled", false); // Disable speech synthesis


// A result of the Tor Uplift effort, this preference isolates all browser identifier sources (e.g. cookies) to the first party domain, with the goal of preventing tracking across different domains. (Don't do this if you are using the Firefox Addon "Cookie AutoDelete" with Firefox v58 or below.)
user_pref("privacy.firstparty.isolate", true);

// A result of the Tor Uplift effort, this preference makes Firefox more resistant to browser fingerprinting.
user_pref("privacy.resistFingerprinting", true);

// FF Tracking Protection
user_pref("privacy.trackingprotection.enabled", true);
user_pref("privacy.trackingprotection.fingerprinting.enabled", true); // [FF67+] Blocks Fingerprinting
user_pref("privacy.trackingprotection.cryptomining.enabled", true); // [FF67+] Blocks CryptoMining
user_pref("privacy.trackingprotection.pbmode.enabled", true); // TP in private browsing mode

// The attribute would be useful for letting websites track visitors' clicks.
user_pref("browser.send_pings", false);
// When browser pings are enabled, only allow pinging the same host as the origin page
// http://kb.mozillazine.org/Browser.send_pings.require_same_host
user_pref("browser.send_pings.require_same_host", true);

// Search Bar Results
user_pref("browser.search.suggest.enabled", false); // Disable search suggestions
user_pref("browser.search.update", false); // Disable search engine changes
user_pref("browser.urlbar.maxRichResults", 3);
user_pref("browser.urlbar.speculativeConnect.enabled", false); // Disable autocomplete URLs

// Disable WebAssembly (Wasm)
user_pref("javascript.options.wasm", false);
user_pref("javascript.options.wasm_baselinejit", false);
user_pref("javascript.options.wasm_ionjit", false);

// Disables playback of DRM-controlled HTML5 content, which, if enabled, automatically downloads the Widevine Content Decryption Module provided by Google Inc.
user_pref("media.eme.enabled", false);

// Disables the Widevine Content Decryption Module provided by Google Inc., used for the playback of DRM-controlled HTML5 content.
user_pref("media.gmp-widevinecdm.enabled", false);


// Disable cookies
//     0 = Accept all cookies by default
//     1 = Only accept from the originating site (block third-party cookies)
//     2 = Block all cookies by default
user_pref("network.cookie.cookieBehavior", 1);

// When to delete cookies (Better to use cookie autodelete).
// 0 = Accept cookies normally
// 1 = Prompt for each cookie
// 2 = Accept for current session only
// 3 = Accept for N days
user_pref("network.cookie.lifetimePolicy", 0);

// Send only the scheme, host, and port in the Referer header.
// 0 = Send the full URL in the Referer header
// 1 = Send the URL without its query string in the Referer header
// 2 = Send only the scheme, host, and port in the Referer header
user_pref("network.http.referer.trimmingPolicy", 2);

// Only send Referer header when the full hostnames match. (Note: if you notice significant breakage, you might try 1 combined with an XOriginTrimmingPolicy tweak below.).
//     0 = Send Referer in all cases
//     1 = Send Referer to same eTLD sites
//     2 = Send Referer only when the full hostnames match
user_pref("network.http.referer.XOriginPolicy", 2);

// When sending Referer across origins, only send scheme, host, and port in the Referer header of cross-origin requests.
//     0 = Send full url in Referer
//     1 = Send url without query string in Referer
//     2 = Only send scheme, host, and port in Referer
user_pref("network.http.referer.XOriginTrimmingPolicy", 2);

// WebGL is a potential security risk.
user_pref("webgl.disabled", true);
// When webGL is enabled, use the minimum capability mode
user_pref("webgl.min_capability_mode", true);
// When webGL is enabled, disable webGL extensions
// https://developer.mozilla.org/en-US/docs/Web/API/WebGL_API#WebGL_debugging_and_testing
user_pref("webgl.disable-extensions", true);
// When webGL is enabled, force enabling it even when layer acceleration is not supported
// https://trac.torproject.org/projects/tor/ticket/18603
user_pref("webgl.disable-fail-if-major-performance-caveat", true);
// When webGL is enabled, do not expose information about the graphics driver
// https://bugzilla.mozilla.org/show_bug.cgi?id=1171228
// https://developer.mozilla.org/en-US/docs/Web/API/WEBGL_debug_renderer_info
user_pref("webgl.enable-debug-renderer-info", false);

// This preference controls when to store extra information about a session: contents of forms, scrollbar positions, cookies, and POST data.
//     0 = Store extra session data for any site. (Default starting with Firefox 4.)
//     1 = Store extra session data for unencrypted (non-HTTPS) sites only. (Default before Firefox 4.)
//     2 = Never store extra session data.
user_pref("browser.sessionstore.privacy_level", 2);

// Even with Firefox set to not remember history, your closed tabs are stored temporarily at Menu -> History -> Recently Closed Tabs.
user_pref("browser.sessionstore.max_tabs_undo", 0);

// Do not auto backup bookmarks
user_pref("browser.bookmarks.max_backups", 0);

// Disable link prefetching
user_pref("network.dns.disablePrefetch", true);
user_pref("network.dns.disablePrefetchFromHTTPS", true);
user_pref("network.predictor.enabled", false);
user_pref("network.predictor.enable-prefetch", false);
user_pref("network.prefetch-next", false);

// Not rendering IDNs as their Punycode equivalent leaves you open to phishing attacks that can be very difficult to notice. 
user_pref("network.IDN_show_punycode", true);

// Disable DOM timing API
// https://wiki.mozilla.org/Security/Reviews/Firefox/NavigationTimingAPI
// https://www.w3.org/TR/navigation-timing/#privacy
user_pref("dom.enable_performance", false);

// Make sure the User Timing API does not provide a new high resolution timestamp
// https://trac.torproject.org/projects/tor/ticket/16336
// https://www.w3.org/TR/2013/REC-user-timing-20131212/#privacy-security
user_pref("dom.enable_user_timing", false);

// Disable Web Audio API
// https://bugzilla.mozilla.org/show_bug.cgi?id=1288359
user_pref("dom.webaudio.enabled", false);


// When geolocation is enabled, use Mozilla geolocation service instead of Google
// https://bugzilla.mozilla.org/show_bug.cgi?id=689252
user_pref("geo.wifi.uri", "https://location.services.mozilla.com/v1/geolocate?key=%MOZILLA_API_KEY%");

// When geolocation is enabled, don't log geolocation requests to the console
user_pref("geo.wifi.logging.enabled", false);


// Disable telephony API
// https://wiki.mozilla.org/WebAPI/Security/WebTelephony
user_pref("dom.telephony.enabled", false);

// Disable speech recognition
// https://dvcs.w3.org/hg/speech-api/raw-file/tip/speechapi.html
// https://developer.mozilla.org/en-US/docs/Web/API/SpeechRecognition
// https://wiki.mozilla.org/HTML5_Speech_API
user_pref("media.webspeech.recognition.enable", false);

// Disable sensor API
// https://wiki.mozilla.org/Sensor_API
user_pref("device.sensors.enabled", false);


// Disable virtual reality devices APIs
// https://developer.mozilla.org/en-US/Firefox/Releases/36#Interfaces.2FAPIs.2FDOM
// https://developer.mozilla.org/en-US/docs/Web/API/WebVR_API
user_pref("dom.vr.enabled", false);

// Disable vibrator API
user_pref("dom.vibrator.enabled", false);

// Disable resource timing API
// https://www.w3.org/TR/resource-timing/#privacy-security
user_pref("dom.enable_resource_timing", false);

// Disable Archive API (Firefox < 54)
// https://wiki.mozilla.org/WebAPI/ArchiveAPI
// https://bugzilla.mozilla.org/show_bug.cgi?id=1342361
user_pref("dom.archivereader.enabled", false);

// Disable face detection
user_pref("camera.control.face_detection.enabled", false);

// Disable GeoIP lookup on your address to set default search engine region
// https://trac.torproject.org/projects/tor/ticket/16254
// https://support.mozilla.org/en-US/kb/how-stop-firefox-making-automatic-connections#w_geolocation-for-default-search-engine
user_pref("browser.search.countryCode", "US");
user_pref("browser.search.region", "US");
user_pref("browser.search.geoip.url", "");

// Set Accept-Language HTTP header to en-US regardless of Firefox localization
// https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Accept-Language
user_pref("intl.accept_languages", "en-US, en");

// Don't use OS values to determine locale, force using Firefox locale setting
// http://kb.mozillazine.org/Intl.locale.matchOS
user_pref("intl.locale.matchOS", false);

// Don't use Mozilla-provided location-specific search engines
user_pref("browser.search.geoSpecificDefaults", false);

// Prevent leaking application locale/date format using JavaScript
// https://bugzilla.mozilla.org/show_bug.cgi?id=867501
// https://hg.mozilla.org/mozilla-central/rev/52d635f2b33d
user_pref("javascript.use_us_english_locale", true);

// Disable WebIDE
// https://trac.torproject.org/projects/tor/ticket/16222
// https://developer.mozilla.org/docs/Tools/WebIDE
user_pref("devtools.webide.enabled", false);
user_pref("devtools.webide.autoinstallADBHelper", false);
user_pref("devtools.webide.autoinstallFxdtAdapters", false);

// Disable remote debugging
// https://developer.mozilla.org/en-US/docs/Tools/Remote_Debugging/Debugging_Firefox_Desktop
// https://developer.mozilla.org/en-US/docs/Tools/Tools_Toolbox#Advanced_settings
user_pref("devtools.debugger.remote-enabled", false);
user_pref("devtools.chrome.enabled", false);
user_pref("devtools.debugger.force-local", true);

// Disallow Necko to do A/B testing
// https://trac.torproject.org/projects/tor/ticket/13170
user_pref("network.allow-experiments", false);

// Disable FlyWeb (discovery of LAN/proximity IoT devices that expose a Web interface)
// https://wiki.mozilla.org/FlyWeb
// https://wiki.mozilla.org/FlyWeb/Security_scenarios
// https://docs.google.com/document/d/1eqLb6cGjDL9XooSYEEo7mE-zKQ-o-AuDTcEyNhfBMBM/edit
// http://www.ghacks.net/2016/07/26/firefox-flyweb
user_pref("dom.flyweb.enabled", false);

// Disable the UITour backend
// https://trac.torproject.org/projects/tor/ticket/19047#comment:3
user_pref("browser.uitour.enabled", false);

// Disable Crash Reports.
user_pref("breakpad.reportURL", "");
user_pref("browser.tabs.crashReporting.sendReport", false);
user_pref("browser.crashReports.unsubmittedCheck.enabled", false);

// Disable Firefox telemetry
user_pref("devtools.onboarding.telemetry.logged", false);
user_pref("toolkit.telemetry.updatePing.enabled", false);
user_pref("browser.newtabpage.activity-stream.feeds.telemetry", false);
user_pref("browser.newtabpage.activity-stream.telemetry", false);
user_pref("browser.ping-centre.telemetry", false);
user_pref("toolkit.telemetry.bhrPing.enabled", false);
user_pref("toolkit.telemetry.enabled", false);
user_pref("toolkit.telemetry.firstShutdownPing.enabled", false);
user_pref("toolkit.telemetry.hybridContent.enabled", false);
user_pref("toolkit.telemetry.newProfilePing.enabled", false);
user_pref("toolkit.telemetry.reportingpolicy.firstRun", false);
user_pref("toolkit.telemetry.shutdownPingSender.enabled", false);
user_pref("toolkit.telemetry.updatePing.enabled", false);
user_pref("toolkit.telemetry.reportingpolicy.firstRun", false);
user_pref("toolkit.telemetry.unified", false);
user_pref("toolkit.telemetry.archive.enabled", false);
user_pref("devtools.onboarding.telemetry.logged", false);
user_pref("toolkit.telemetry.bhrPing.enabled", false);
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("datareporting.policy.dataSubmissionEnabled", false);
user_pref("datareporting.sessions.current.clean", true);
user_pref("datareporting.sessions.current.clean", true);
user_pref("datareporting.policy.firstRunURL", "");
user_pref("toolkit.telemetry.server", "");
user_pref("browser.selfsupport.url", "");
user_pref("loop.logDomains", false);
user_pref("app.normandy.api_url", "");
user_pref("app.normandy.enabled", false); // Disable shield telemetry
user_pref("app.shield.optoutstudies.enabled", false);

// Diable captive portal detection for public wifi
user_pref("network.captive-portal-service.enabled", false);
user_pref("captivedetect.canonicalURL", "");
user_pref("network.connectivity-service.enabled", false);

// Extensions

user_pref("extensions.allowPrivateBrowsingByDefault", false);
user_pref("extensions.blocklist.enabled", false); // Disable blocklist
user_pref("extensions.getAddons.discovery.api_url", "");
user_pref("extensions.systemAddon.update.enabled", false); // Disable system add-ons updates
user_pref("extensions.systemAddon.update.url", "");
user_pref("extensions.update.autoUpdateDefault", false); // Disable autoinstall extension updates
user_pref("extensions.update.enabled", false); // Disable autochecking for extension updates

// Ensure you have a security delay when installing add-ons (milliseconds)
// http://kb.mozillazine.org/Disable_extension_install_delay_-_Firefox
// http://www.squarefree.com/2004/07/01/race-conditions-in-security-dialogs/
user_pref("security.dialog_enable_delay", 1000);

// Opt-out of add-on metadata updates
// https://blog.mozilla.org/addons/how-to-opt-out-of-add-on-metadata-updates/
user_pref("extensions.getAddons.cache.enabled", false);

// Opt-out of themes (Persona) updates
// https://support.mozilla.org/t5/Firefox/how-do-I-prevent-autoamtic-updates-in-a-50-user-environment/td-p/144287
user_pref("lightweightThemes.update.enabled", false);

// Disable Flash Player NPAPI plugin
// http://kb.mozillazine.org/Flash_plugin
user_pref("plugin.state.flash", 0);

// Disable Java NPAPI plugin
user_pref("plugin.state.java", 0);

// Disable sending Flash Player crash reports
user_pref("dom.ipc.plugins.flash.subprocess.crashreporter.enabled", false);

// When Flash crash reports are enabled, don't send the visited URL in the crash report
user_pref("dom.ipc.plugins.reportCrashURL", false);

// When Flash is enabled, download and use Mozilla SWF URIs blocklist
// https://bugzilla.mozilla.org/show_bug.cgi?id=1237198
// https://github.com/mozilla-services/shavar-plugin-blocklist
user_pref("browser.safebrowsing.blockedURIs.enabled", true);

// Disable Shumway (Mozilla Flash renderer)
// https://developer.mozilla.org/en-US/docs/Mozilla/Projects/Shumway
user_pref("shumway.disabled", true);

// Disable Gnome Shell Integration NPAPI plugin
user_pref("plugin.state.libgnome-shell-browser-plugin", 0);

// Enable plugins click-to-play
// https://wiki.mozilla.org/Firefox/Click_To_Play
// https://blog.mozilla.org/security/2012/10/11/click-to-play-plugins-blocklist-style/
user_pref("plugins.click_to_play", true);

// Decrease system information leakage to Mozilla blocklist update servers
// https://trac.torproject.org/projects/tor/ticket/16931
user_pref("extensions.blocklist.url", "https://blocklist.addons.mozilla.org/blocklist/3/%APP_ID%/%APP_VERSION%/");

