from qutebrowser.api import interceptor, message
from PyQt5.QtCore import QUrl
from cconfig import CConfig

def redir(r: interceptor.Request, target, dst):
    url = r.request_url
    furl = r.first_party_url

    # don't redirect if coming from destination
    # some alt-sites such as libreddit have a link to the original source
    # we want to be able to visit that link
    if furl.host() == dst:
        return

    if url.host() == target:
        url.setHost(dst)
        try:
            r.redirect(url)
        except interceptor.interceptors.RedirectException:
            pass

def redirect(r: interceptor.Request):
    """Block the given request if necessary."""
    if (r.resource_type != interceptor.ResourceType.main_frame or
            r.request_url.scheme() in {"data", "blob"}):
        return

    if CConfig(config).redirect :
        # youtube
        redir(r, 'youtube.com', 'yewtu.be')
        redir(r, 'www.youtube.com', 'yewtu.be')
        # twitter
        redir(r, 'twitter.com', 'nitter.net')
        redir(r, 'www.twitter.com', 'nitter.net')
        # reddit
        redir(r, 'reddit.com', 'libreddit.some-things.org')
        redir(r, 'www.reddit.com', 'libreddit.some-things.org')
        redir(r, 'old.reddit.com', 'libreddit.some-things.org')
        redir(r, 'www.old.reddit.com', 'libreddit.some-things.org')


interceptor.register(redirect)
