# coding: UTF-8

from fastapi import FastAPI, Request
import uvicorn

app = FastAPI()

@app.post("/")
def any_route(request: Request):
  print(     request.headers )
  print(dict(request.headers)) # 辞書型に変換
  return {}

@app.get("/")
def any_route(request: Request):
    print(     request.headers )
    print(dict(request.headers))

if __name__ == "__main__":
  uvicorn.run("main:app", reload=True)