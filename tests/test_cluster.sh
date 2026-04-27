#!/usr/bin/env bash
set -euo pipefail

fail() { echo "FAIL: $1" >&2; exit 1; }

minikube status >/dev/null || fail "minikube is not running"
kubectl get nodes -o jsonpath='{.items[0].status.conditions[?(@.type=="Ready")].status}' \
  | grep -q True || fail "node is not Ready"

if kubectl get deploy hello >/dev/null 2>&1; then
  kubectl rollout status deploy/hello --timeout=120s
  url="$(minikube service hello --url)"
  curl --fail --silent --show-error --max-time 10 "${url}" >/dev/null \
    || fail "hello service did not respond at ${url}"
  echo "OK: hello service reachable at ${url}"
else
  echo "OK: cluster healthy (hello deployment not present — run 'make deploy' to test workload)"
fi
