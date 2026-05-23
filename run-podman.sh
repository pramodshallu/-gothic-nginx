#!/bin/bash
echo "🔄 Syncing latest code from GitHub..."
git pull origin main

echo "🛑 Removing old container instance..."
podman stop gothic-site 2>/dev/null || true
podman rm gothic-site 2>/dev/null || true

echo "🔨 Building Podman image..."
podman build -t test-nginx:v1 .

echo "🚀 Starting Nginx server..."
podman run -d --name gothic-site -p 8082:80 test-nginx:v1

echo "✅ Success! Open http://localhost:8082 in your browser."
