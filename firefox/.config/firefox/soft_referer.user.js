//
// #### SOFT.REFERER.USER.JS ####
//
// Send the URL without its query string in the Referer header

// 0 = Send the full URL in the Referer header
// 1 = Send the URL without its query string in the Referer header
// 2 = Send only the scheme, host, and port in the Referer header
user_pref("network.http.referer.trimmingPolicy", 1);

