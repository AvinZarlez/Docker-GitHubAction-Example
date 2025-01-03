# Multi-Architecture Docker Image with GitHub Actions
This repository demonstrates how to use GitHub Actions workflows to build a multi-architecture Docker image. Below, we will explain the `Dockerfile` and the `build.yml` workflow file line by line.

## Dockerfile ([`Dockerfile`](./Dockerfile))

1. `FROM --platform=${BUILDPLATFORM} ubuntu:24.04`: Specifies the base image to use for the Docker image. The `--platform=${BUILDPLATFORM}` directive allows the image to be built for different architectures.
2. `CMD ["echo", "Hello World!"]`: Defines the command to run when the container starts. In this case, it will print "Hello World!" to the console.

## GitHub Actions Workflow ([`build.yml`](.github/workflows/build.yml))

1. `name: Build and Push Docker Image`: The name of the workflow.
2. `on: push: branches: - main`: Specifies that the workflow will run on pushes to the `main` branch.
3. `on: pull_request`: Specifies that the workflow will also run on pull requests.
4. `jobs: build: env: IMAGE_NAME: 'githubaction-example'`: Defines a job named `build` with an environment variable `IMAGE_NAME`.
5. `runs-on: ubuntu-latest`: Specifies that the job will run on the latest version of Ubuntu.
6. `steps`: Lists the steps to be executed in the job.
7. `- name: Checkout code`: Checks out the repository code using the `actions/checkout@v2` action.
8. `- name: Set image name`: Sets the image name using the DockerHub username and the environment variable `IMAGE_NAME`.
9. `- name: Extract Docker image metadata`: Extracts metadata for the Docker image using the `docker/metadata-action@v5` action.
10. `- name: Login to DockerHub`: Logs into DockerHub using the `docker/login-action@v3` action. The DockerHub username and password are stored as secrets in the repository.
11. `- name: Set up Docker Buildx`: Sets up Docker Buildx, a Docker CLI plugin for extended build capabilities, using the `docker/setup-buildx-action@v3` action.
12. `- name: Build and push Docker image`: Builds and pushes the Docker image using the `docker/build-push-action@v6` action. The `context` is set to the current directory, `platforms` specifies the target platforms, `push` is set to true unless the event is a pull request, `tags` specifies the image tags, `annotations` specifies the image annotations, `provenance` is set to true to include provenance information, and `sbom` is set to true to include a software bill of materials.

This setup ensures that the Docker image is built and pushed to DockerHub for both `amd64` and `arm64` architectures whenever there is a push to the `main` branch or a pull request.