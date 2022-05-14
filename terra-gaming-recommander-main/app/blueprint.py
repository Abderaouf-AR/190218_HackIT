from flask import Blueprint, request
import requests

USER_ID = ""
DEV_ID = "190218-dev-LjM9ZEbO0f"
X_API_KEY = "e412d50493a8b40765f8ef274b2eea80730ecf9728ccf59d68e24a937d29a9c9"

headers = dict()
headers["dev-id"] = DEV_ID
headers["Content-Type"] = "application/json"
headers["X-API-Key"] = X_API_KEY

blueprint = Blueprint('blueprint', __name__)

@blueprint.route('/')
def index():
    return "Hi! I am root!"

@blueprint.route("/terra", methods=["POST"])
def handle_terra_webhook():
    return request.json


@blueprint.route("/req_widget_session", methods=["POST"])
def req_widget_session():
    data_tosend = {
        "reference_id": "",
        "providers": "FITBIT",
        "auth_success_redirect_url": "https://tryterra.co",
        "auth_failure_redirect_url": "v",
        "language": "EN"
    }

    resp = requests.post("https://api.tryterra.co/v2/auth/generateWidgetSession",
                        headers=headers,
                        json=data_tosend
                        )
    print(resp)
    print(resp.json())
    return resp.json()