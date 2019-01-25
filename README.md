# sparklingwater_k8s

This repo contains Docker and Kubernetes configurations for Sparkling Water. It consist of two parts, a configuration for the Spark master node and one for the worker nodes (contained in the directories `master` and `worker` respectively). In each directory there is a Dockerfile that builds an image for each type of Spark node. They largely contain the same software (i.e. Apache Spark and Sparkling Water) - the difference is how they start up.

In order to build the Docker images you need to place copies of the [Apache Spark](https://spark.apache.org/downloads.html) and [Sparkling Water](https://www.h2o.ai/download/) builds in the `src` directories of `master` and `worker`. This has been tested using Spark 2.4.0 and Sparkling Water 2.4.2, so the two build files for that set of versions are `spark-2.4.0-bin-hadoop2.7.tgz` and `sparkling-water-2.4.2.zip` respectively. Once you have those you can build the two Docker images.

Once the images are built you can create a Spark cluster using Kubernetes. An example of how this is done is provided by `sparklingwater.yaml`. This defines one master and three workers for the Spark cluster by creating a deployment for master and worker with appropriate replicas. The master and workers communicate via a ClusterIP service. For external access to the Spark cluster web ui, a NodePort service exposes the relevant ports.
