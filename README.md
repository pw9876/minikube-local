# minikube-local

Local single-node Kubernetes cluster on macOS via [minikube](https://minikube.sigs.k8s.io/).

Targets Intel and Apple Silicon iMacs. Uses the `docker` driver (Docker Desktop), which is the most reliable option on current macOS.

## Quickstart

```sh
make install   # brew install docker, minikube, kubectl
make start     # boot the cluster
make deploy    # apply manifests/hello.yaml
make smoke     # curl the hello service
make dashboard # open Kubernetes dashboard
make stop      # stop the cluster (keeps state)
make reset     # delete the cluster entirely
```

## Prerequisites

- macOS 13+ (tested on 26.4)
- [Homebrew](https://brew.sh)
- Docker Desktop running before `make start`

## Configuration

Override defaults via environment variables:

| Variable          | Default | Purpose                          |
|-------------------|---------|----------------------------------|
| `MINIKUBE_CPUS`   | `4`     | vCPUs allocated to the cluster   |
| `MINIKUBE_MEMORY` | `8192`  | Memory in MB                     |
| `MINIKUBE_DISK`   | `40g`   | Disk size                        |
| `K8S_VERSION`     | stable  | Kubernetes version (`v1.30.0` …) |

Example:

```sh
MINIKUBE_CPUS=6 MINIKUBE_MEMORY=12288 make start
```

## Layout

```
scripts/      shell entrypoints invoked by the Makefile
manifests/    Kubernetes YAML applied by `make deploy`
tests/        smoke tests (shellcheck-clean, run in CI)
```
