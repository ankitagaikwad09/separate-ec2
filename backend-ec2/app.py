from flask import Flask, request, jsonify


app = Flask(__name__)
@app.route("/")
def health():
    return "OK", 200

@app.route("/api/register", methods=["POST"])
def register():
    data = request.json
    return jsonify({
        "message": "Registration successful",
        "user": data
    })

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)