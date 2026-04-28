# Final Project ACMP2400

This is my final project for ACMP2400. It is an Ubuntu-based Docker container that prints “hello world” when executed and is deployed on the Azure Cloud platform.

## Run Code via github action workflow

Go to the Actions tab and run the workflow "Build-Curl-Test-Deploy-Test-Undeploy" to build and deploy the Docker container.

## Hosted container link

http://acmp-colebreinig-instance.centralus.azurecontainer.io:8000/

## File Structure

```bash
ACMP2400/
│
├── .dockerignore
├── .env
├── Dockerfile
├── manage.py
├── requirements.txt
│
├── .github/
│   └── actions/
│       ├── sbom-scan/
│       │   ├── action.yaml
│       │   ├── Dockerfile
│       │   └── entrypoint.sh
│       │
│       └── terraform/
│           ├── action.yaml
│           ├── Dockerfile
│           ├── entrypoint.sh
│           └── curl_test.yaml
│
├── final_app/
│   ├── asgi.py
│   ├── settings.py
│   ├── urls.py
│   ├── wsgi.py
│   └── __init__.py
│
├── hello_final/
│   ├── admin.py
│   ├── apps.py
│   ├── models.py
│   ├── tests.py
│   ├── urls.py
│   ├── views.py
│   ├── __init__.py
│   │
│   └── migrations/
│       └── __init__.py
│
├── stage1/
│   └── main.tf
│
├── stage2/
│   └── main.tf
│
└── stage3/
    └── main.tf
```
