from flask import Flask, jsonify


justice_league_members = [
    {"superhero": "Aquaman", "real_name": "Arthur Curry"},
    {"superhero": "Batman", "real_name": "Bruce Wayne"},
    {"superhero": "Cyborg", "real_name": "Victor Stone"},
    {"superhero": "Flash", "real_name": "Barry Allen"},
    {"superhero": "Green Lantern", "real_name": "Hal Jordan"},
    {"superhero": "Superman", "real_name": "Clark Kent/Kal-El"},
    {"superhero": "Wonder Woman", "real_name": "Princess Diana"}
]

app = Flask(__name__)

@app.route("/api/v1.0/justice-league")
def justice_league():
    return jsonify(justice_league_members)

@app.route("/")
def root():
    return (f"/api/v1.0/justice-league")


if __name__ == "__main__":
    app.run(debug=True)