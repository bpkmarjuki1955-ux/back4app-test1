from flask import Flask, jsonify, request

app = Flask(__name__)

@app.get("/health")
def health():
    return jsonify(status="ok")

@app.post("/echo")
def echo():
    data = request.get_json(silent=True) or {}
    return jsonify(received=data)

if __name__ == "__main__":
    # untuk local run
    app.run(host="0.0.0.0", port=8080)
