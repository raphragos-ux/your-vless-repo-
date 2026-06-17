#!/bin/bash
set -e

echo "✅ Starting VLESS + Xray service..."
echo "📡 Listening on port 443"

exec xray run -c /app/config.json

