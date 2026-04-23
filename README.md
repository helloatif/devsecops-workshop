# 🚀 DevSecOps Workshop - Complete CI/CD Pipeline

[![DevSecOps Pipeline](https://github.com/helloatif/devsecops-workshop/actions/workflows/devsecops.yml/badge.svg)](https://github.com/helloatif/devsecops-workshop/actions/workflows/devsecops.yml)

## 📋 Project Overview

A complete, enterprise-grade **DevSecOps pipeline** implementing Docker, Kubernetes (Minikube), and GitHub Actions with "Shift-Left" security practices.

## 🛠️ Technology Stack

| Technology | Purpose |
|------------|---------|
| Node.js/Express | Backend REST API |
| Helmet/CORS/Morgan | Security & logging |
| Jest & Supertest | Automated testing |
| GitHub Actions | CI/CD automation |
| npm audit | Dependency scanning |
| Trivy | Container scanning |
| Docker | Containerization |
| Kubernetes | Orchestration |

## ✨ Features

### 🔒 Security
- Helmet.js for secure HTTP headers
- CORS for cross-origin requests
- Morgan for request logging
- npm audit for dependency vulnerabilities
- Trivy for container image scanning

### 🎨 API Endpoints
| Endpoint | Description |
|----------|-------------|
| `/` | Welcome message |
| `/api/health` | Health check with uptime |
| `/api/users` | Returns user data |
| `/dashboard` | Beautiful UI dashboard |

## 🚀 Quick Start

```bash
cd app && npm install
npm test
npm start
```

## 👨‍💻 Author

**Atif Imran (helloatif)**
- GitHub: [@helloatif](https://github.com/helloatif)
- Student ID: F2022266378
- Section: V1

## 📚 Course

Cloud Computing (CCP) - DevSecOps Lab

## 🎉 Status: Production Ready ✅
