//
// #### SOFT.REFERER.USER.JS ####
//
// Send the URL without its query string in the Referer header

// Send only the scheme, host, and port in the Referer header.
// 0 = Send the full URL in the Referer header
// 1 = Send the URL without its query string in the Referer header
// 2 = Send only the scheme, host, and port in the Referer header
user_pref("network.http.referer.trimmingPolicy", 2);

// Only send Referer header when the full hostnames match. (Note: if you notice significant breakage, you might try 1 combined with an XOriginTrimmingPolicy tweak below.).
//     0 = Send Referer in all cases
//     1 = Send Referer to same eTLD sites
//     2 = Send Referer only when the full hostnames match
user_pref("network.http.referer.XOriginPolicy", 1);

// When sending Referer across origins, only send scheme, host, and port in the Referer header of cross-origin requests.
//     0 = Send full url in Referer
//     1 = Send url without query string in Referer
//     2 = Only send scheme, host, and port in Referer
user_pref("network.http.referer.XOriginTrimmingPolicy", 2);
