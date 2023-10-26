from fastapi import FastAPI
import uvicorn
from mylib.logic import search_wiki
from mylib.logic import wiki as wikilogic
from mylib.logic import phrase as wikiphrases

app = FastAPI()

@app.get("/")
async def root():
    return {"message": "Wikipedia API. Call /search or /wiki"}

@app.get("/search/{value}")
async def search(value: str):
    """Page to search in wikipedia"""

    result = search_wiki(value)
    return {"results": result}

@app.get("/wiki/{name}")
async def wiki(name: str):
    """Retrive wikipedia page"""

    result = wikilogic(name)
    return {"results": result}

@app.get("/phrase/{name}")
async def phrase(name: str):
    """Retrive wikipedia page and return phrases"""

    result = wikiphrases(name)
    return {"results": result}


if __name__ == '__main__':
    uvicorn.run(app, port=8080, host='0.0.0.0')
