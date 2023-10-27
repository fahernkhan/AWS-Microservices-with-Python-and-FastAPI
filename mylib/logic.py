import wikipedia
from textblob import TextBlob


def wiki(name="war Goddess", length=1):
    """This is a wikipedia fetcher"""

    my_wiki = wikipedia.summary(name, length)
    return my_wiki


def search_wiki(name):
    """Search Wikipedia for Names"""

    result = wikipedia.search(name)
    return result


def phrase(name):
    """Returns a phrase from wikipedia"""

    page = wiki(name)
    blob = TextBlob(page)
    return blob.noun_phrases
