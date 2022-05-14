import mongoengine as me


class Game(me.Document):
    uuid = me.UUIDField(binary=False, required=True, unique=True)
    game_name = me.StringField(min_length=1, required=True)
    min_age = me.IntField(required=True)
    plateforme = me.StringField(min_length=5, required=True)
    category = me.ListField(me.StringField(min_length=1))
