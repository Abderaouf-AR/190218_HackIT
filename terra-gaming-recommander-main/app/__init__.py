from flask import Flask
from flask_mongoengine import MongoEngine

from .blueprint import blueprint


app = Flask(__name__, instance_relative_config=True)
app.register_blueprint(blueprint, url_prefix="/")
app.config.from_mapping(
    SECRET_KEY="dev",
)
app.config["MONGODB_SETTINGS"] = {}

db = MongoEngine(app)
