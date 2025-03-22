#!/bin/bash
# Get the status of all nodes
NODES_STATUS=$(microk8s kubectl get nodes --no-headers)

# Check each node's status
while read -r LINE; do
  NODE_NAME=$(echo $LINE | awk '{print $1}')
  NODE_STATUS=$(echo $LINE | awk '{print $2}')

  if [[ "$NODE_STATUS" == "Ready" ]]; then
    echo "Node $NODE_NAME is ready."
  else
    echo "Node $NODE_NAME is not ready (Status: $NODE_STATUS)."
  fi
done <<< "$NODES_STATUS"
