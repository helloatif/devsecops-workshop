#!/bin/bash

# DevSecOps Workshop - Auto Setup Script
# This script automates the entire setup process

set -e

echo "🚀 DevSecOps Workshop Setup Script"
echo "=================================="
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if Docker is installed
check_docker() {
    echo "📦 Checking Docker installation..."
    if command -v docker &> /dev/null; then
        echo -e "${GREEN}✅ Docker found${NC}"
        docker --version
    else
        echo -e "${RED}❌ Docker not found. Please install Docker first.${NC}"
        exit 1
    fi
}

# Check if Minikube is installed
check_minikube() {
    echo ""
    echo "📦 Checking Minikube installation..."
    if command -v minikube &> /dev/null; then
        echo -e "${GREEN}✅ Minikube found${NC}"
        minikube version
    else
        echo -e "${RED}❌ Minikube not found. Please install Minikube first.${NC}"
        exit 1
    fi
}

# Install dependencies
install_deps() {
    echo ""
    echo "📦 Installing Node.js dependencies..."
    cd app
    npm install
    echo -e "${GREEN}✅ Dependencies installed${NC}"
    cd ..
}

# Run tests
run_tests() {
    echo ""
    echo "🧪 Running tests..."
    cd app
    npm test
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✅ All tests passed${NC}"
    else
        echo -e "${RED}❌ Tests failed${NC}"
        exit 1
    fi
    cd ..
}

# Build Docker image
build_docker() {
    echo ""
    echo "🐳 Building Docker image..."
    docker build -t devsecops-app ./app
    echo -e "${GREEN}✅ Docker image built${NC}"
}

# Load image into Minikube
load_to_minikube() {
    echo ""
    echo "📦 Loading image into Minikube..."
    minikube image load devsecops-app:latest
    echo -e "${GREEN}✅ Image loaded into Minikube${NC}"
}

# Deploy to Kubernetes
deploy_k8s() {
    echo ""
    echo "☸️ Deploying to Kubernetes..."
    kubectl apply -f k8s/
    echo -e "${GREEN}✅ Deployment complete${NC}"
}

# Get service URL
get_service_url() {
    echo ""
    echo "🌐 Getting service URL..."
    sleep 5
    URL=$(minikube service devsecops-svc --url 2>/dev/null)
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✅ Application available at: ${URL}${NC}"
        echo ""
        echo "📝 You can also access:"
        echo "   - Dashboard: ${URL}/dashboard"
        echo "   - Health: ${URL}/api/health"
        echo "   - Users API: ${URL}/api/users"
    else
        echo -e "${YELLOW}⚠️ Service may take a moment. Run 'minikube service devsecops-svc --url' manually${NC}"
    fi
}

# Show status
show_status() {
    echo ""
    echo "=================================="
    echo -e "${GREEN}🎉 DevSecOps Workshop is ready!${NC}"
    echo "=================================="
    echo ""
    kubectl get pods
    echo ""
    echo "📚 Useful commands:"
    echo "   - View pods: kubectl get pods"
    echo "   - View logs: kubectl logs -l app=devsecops-app"
    echo "   - Stop Minikube: minikube stop"
    echo "   - Delete deployment: kubectl delete -f k8s/"
}

# Main execution
main() {
    check_docker
    check_minikube
    install_deps
    run_tests
    build_docker
    load_to_minikube
    deploy_k8s
    get_service_url
    show_status
}

# Run main function
main
