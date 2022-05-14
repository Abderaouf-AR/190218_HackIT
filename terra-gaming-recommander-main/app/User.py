import mongoengine as me


class User(me.Document):
    uuid = me.UUIDField(binary=False, required=True, unique=True)
    username = me.StringField(min_length=1, required=True)
    password = me.StringField(min_length=1, required=True)
    email = me.StringField(min_length=5, required=True)
    terra_ids = me.ListField(me.StringField(min_length=1))
