def psycho_state_detector(heart_rate):
    if heart_rate > 100:
        return "Angry"
    if heart_rate < 60:
        return "Disgust"    
    if heart_rate > 90:
        return "Happy"
    if heart_rate < 70:
        return "Sad"
        
    return "Neutral"

import pandas as pd
import numpy as np
from sklearn.metrics.pairwise import cosine_similarity
from sklearn.feature_extraction.text import CountVectorizer

def game_recommander(title):
    df = pd.read_csv("./video_games.csv")
    for i in range(0, df.shape[0]):
        embedded = (
            str(df["Title"][i])
            + " "
            + str(df["Metrics.Review Score"][i])
            + " "
            + str(df["Metadata.Genres"][i])
        )
        df["important_features"][i] = embedded

    cm = CountVectorizer().fit_transform(df["important_features"])
    cs = cosine_similarity(cm)

    try:
        game_id = df[df.Title == title]["Game_id"].values[0]
        scores = list(enumerate(cs[game_id]))
        sorted_scores = sorted(scores, key=lambda x: x[1], reverse=True)
        sorted_scores = sorted_scores[1:]
        recommanded_game = df[df.Game_id == sorted_scores[0][0]]["Title"].values[0]
        return recommanded_game
    except:
        return df["Title"][np.random.randint(df.shape[0])]

print(game_recommander('Spider'))