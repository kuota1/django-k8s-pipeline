# 🗂️ Django API with CI/CD Pipeline (Docker, GitHub Actions, K3s)

This project is a simple Django-based API integrated with a complete DevOps pipeline. It includes automated image building, testing, security scanning, and deployment using GitHub Actions and Docker. It was designed as part of a learning process to strengthen practical skills in CI/CD and container orchestration.

## 🚀 Tech Stack

- **Backend:** Django 5.2 (Python 3.10)
- **Database:** SQLite (lightweight for testing purposes)
- **Containerization:** Docker
- **CI/CD:** GitHub Actions
- **Kubernetes Testing:** K3s via GitHub Actions (optional - can be disabled)
- **Security Scanning:** Trivy (via GitHub Actions)

## 📁 Project Structure

 ├── base/ # Django app with templates ├── proyecto/ # Django core config ├── Dockerfile # Multi-stage Docker build ├── requirements.txt # Python dependencies ├── docker-compose.test.yml # Used in integration tests ├── .github/workflows/ # CI/CD pipeline definitions ├── manifests/ # Kubernetes deployment YAML └── README.md

 
## 🐳 Run Locally with Docker

You can run the project locally using Docker Compose:

```bash
docker compose -f docker-compose.test.yml up --build

Then visit: http://localhost:8000

⚠️ This project uses SQLite for testing; no external DB is needed.

⚙️ GitHub Actions Workflow
The pipeline includes the following stages:

Build & Push Image to Docker Hub and GHCR.

Unit Testing (can be extended with Pytest).

Integration Testing via Docker Compose and healthchecks.

(Optional) Deployment to K3s and smoke tests.

Security Scan with Trivy.

Final Image Build only if all previous stages succeed.

You can find the CI/CD definitions inside .github/workflows/despliegue-test-api.yml.

✅ Future Improvements
Replace SQLite with PostgreSQL in production.

Add Pytest for real unit tests.

Enhance smoke test and monitoring.

Add Helm support for Kubernetes.

📜 License
MIT License

👤 Author
Roberto Rodriguez
GitHub: @kuota1