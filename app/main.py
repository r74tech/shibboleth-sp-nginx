# coding: UTF-8

from fastapi import FastAPI, Request
import uvicorn

app = FastAPI()

@app.get("/")
def shibboleth(request: Request):
    if "auth_type" not in request.headers:
        return {"error": "No Shibboleth headers found"}
    shibboleth = {
        "auth_type": request.headers["auth_type"],
        "remote_user": request.headers["remote_user"],
        "shib-handler": request.headers["shib-handler"],
        "shib-identity-provider": request.headers["shib-identity-provider"],
        "displayname": request.headers["displayname"],
        "givenname": request.headers["givenname"],
        "uid": request.headers["uid"],
    }

    return shibboleth
    


if __name__ == "__main__":
  uvicorn.run("main:app", reload=True)