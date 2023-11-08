# coding: UTF-8

from fastapi import FastAPI, Request
import uvicorn

app = FastAPI()

@app.get("/")
def shibboleth(request: Request):
    shibboleth = {
        "auth_type": request.headers["auth_type"],
        "remote_user": request.headers["remote_user"],
        "shib-application-id": request.headers["shib-application-id"],
        "shib-authentication-instant": request.headers["shib-authentication-instant"],
        "shib-authentication-method": request.headers["shib-authentication-method"],
        "shib-authncontext-class": request.headers["shib-authncontext-class"],
        "shib-handler": request.headers["shib-handler"],
        "shib-identity-provider": request.headers["shib-identity-provider"],
        "shib-session-expires": request.headers["shib-session-expires"],
        "shib-session-id": request.headers["shib-session-id"],
        "shib-session-inactivity": request.headers["shib-session-inactivity"],
        "shib-session-index": request.headers["shib-session-index"],
        "displayname": request.headers["displayname"],
        "entitlement": request.headers["entitlement"],
        "givenname": request.headers["givenname"],
        "mail": request.headers["mail"],
        "sn": request.headers["sn"],
        "subject-id": request.headers["subject-id"],
        "telephonenumber": request.headers["telephonenumber"],
        "uid": request.headers["uid"],
    }

    return shibboleth
    


if __name__ == "__main__":
  uvicorn.run("main:app", reload=True)