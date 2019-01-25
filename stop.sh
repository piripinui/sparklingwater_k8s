#!/bin/sh
# Tears down the resources created by the sparklingwater.yaml configuration.
kubectl delete deployment sparklingwater-master-deployment
kubectl delete deployment sparklingwater-worker-deployment
kubectl delete svc sparklingwater-external
kubectl delete svc sparklingwater-cluster-svc
