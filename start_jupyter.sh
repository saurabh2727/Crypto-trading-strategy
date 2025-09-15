#!/bin/bash

# Melbourne Datathon - Start Jupyter Lab
echo "🚀 Starting Melbourne Datathon Environment..."

# Navigate to project directory
cd "$(dirname "$0")"

# Activate virtual environment
echo "📦 Activating virtual environment..."
source datathon_env/bin/activate

# Start Jupyter Lab
echo "🔬 Starting Jupyter Lab..."
echo "📁 Working directory: $(pwd)"
echo "🌐 Jupyter will open in your browser"
echo "📝 Select 'Datathon Environment' kernel when opening notebooks"
echo ""

jupyter lab --no-browser --port=8888