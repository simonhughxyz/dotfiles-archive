//
// #### DRM_ENABLED.USER.JS ####
//
// Enables playback of DRM-controlled HTML5 content

// if enabled, automatically downloads the Widevine Content Decryption Module provided by Google Inc.
user_pref("media.eme.enabled", true);

// Enable the Widevine Content Decryption Module provided by Google Inc.,
// used for the playback of DRM-controlled HTML5 content.
user_pref("media.gmp-widevinecdm.enabled", true);
