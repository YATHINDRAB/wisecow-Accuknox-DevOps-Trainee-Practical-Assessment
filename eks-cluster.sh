#!/usr/bin/env bash

CLUSTER_NAME=wisecow-cluster
REGION=ap-south-1
NODE_TYPE=t3.medium
NODES=2

echo "🚀 Creating EKS cluster: $CLUSTER_NAME"

eksctl create cluster \
  --name $CLUSTER_NAME \
  --region $REGION \
  --nodegroup-name standard-workers \
  --node-type $NODE_TYPE \
  --nodes $NODES \
  --nodes-min 1 \
  --nodes-max 3 \
  --managed

echo "✅ EKS cluster created"

kubectl get nodes

