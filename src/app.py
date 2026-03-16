import os
import socket
from flask import Flask, jsonify

app = Flask(__name__)

# Route 1: The Main Landing Page
@app.route('/')
def home():
    return jsonify({
        "status": "success",
        "message": "Hello from Terraform-managed Docker!",
        "container_id": socket.gethostname(),
        "environment": os.getenv("FLASK_ENV", "production")
    })

# Route 2: Health Check (Standard for Docker/Kubernetes)
@app.route('/health')
def health_check():
    return jsonify({"status": "healthy"}), 200

# Route 3: Dynamic Data Example
@app.route('/info')
def get_info():
    data = {
        "framework": "Flask",
        "orchestrator": "Terraform",
        "platform": "Docker Desktop (macOS)"
    }
    return jsonify(data)

if __name__ == "__main__":
    # Get port from environment or default to 5000
    port = int(os.environ.get("PORT", 5000))
    
    # CRITICAL: host='0.0.0.0' allows external access from Docker
    app.run(host='0.0.0.0', port=port, debug=False)

