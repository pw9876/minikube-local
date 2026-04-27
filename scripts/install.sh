#!/usr/bin/env bash
set -euo pipefail

if ! command -v brew >/dev/null 2>&1; then
  echo "error: Homebrew is required. Install from https://brew.sh" >&2
  exit 1
fi

brew install --quiet minikube kubectl

if ! command -v docker >/dev/null 2>&1; then
  echo "Docker not found — installing Docker Desktop cask."
  brew install --quiet --cask docker
  echo "Launch Docker Desktop once to complete setup, then re-run 'make start'."
fi

minikube version
kubectl version --client
