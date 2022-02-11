from qutebrowser.api import interceptor, message
from PyQt5.QtCore import QUrl

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
        message.info("Redirecting to " + url.toString())
        r.redirect(url)

def redirect(r: interceptor.Request):
    """Block the given request if necessary."""
    if (r.resource_type != interceptor.ResourceType.main_frame or
            r.request_url.scheme() in {"data", "blob"}):
        return

    redir(r, 'youtube.com', 'yewtu.be')
    redir(r, 'www.youtube.com', 'yewtu.be')
    redir(r, 'twitter.com', 'nitter.net')
    redir(r, 'www.twitter.com', 'nitter.net')
    redir(r, 'reddit.com', 'libreddit.silkky.cloud')
    redir(r, 'www.reddit.com', 'libreddit.silkky.cloud')


interceptor.register(redirect)
