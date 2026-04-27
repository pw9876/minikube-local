#!/usr/bin/env bash
set -euo pipefail

CPUS="${MINIKUBE_CPUS:-4}"
MEMORY="${MINIKUBE_MEMORY:-8192}"
DISK="${MINIKUBE_DISK:-40g}"
K8S_VERSION="${K8S_VERSION:-stable}"

if ! docker info >/dev/null 2>&1; then
  echo "error: Docker daemon is not running. Start Docker Desktop and retry." >&2
  exit 1
fi

minikube start \
  --driver=docker \
  --cpus="${CPUS}" \
  --memory="${MEMORY}" \
  --disk-size="${DISK}" \
  --kubernetes-version="${K8S_VERSION}" \
  --addons=ingress,metrics-server

kubectl cluster-info
