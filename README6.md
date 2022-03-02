# Helm Chart for Arango DB

## Introduction

This Helm chart installs Arango DB  in a Kubernetes cluster.

## Prerequisites

- Kubernetes cluster 1.10+
- Helm 3.0.0+

## Installation

### Install the chart

Install the Arango DB helm chart with a release name my-release:

> helm install my-release arango/

## Install with custom values.yaml

> helm install my-release arango/ -f custom-values.yaml


## Uninstallation

To uninstall/delete the my-release deployment:

> helm uninstall my-release


## Init container Usage

Here in this Helm chart we are using Init Container which can enabled by setting value to true else if not required then set to false.

If we want run arango pod with non root user and want to mount volume with that user and group permission then in that case we deploy initContainer which changes permission of volume from root user to non root user and complete it action.

## To remove Init container once helm deployed

To remove init container from helm deployment we need to set initContainers set enabled value to false and upgrade the helm with the updated values.yaml.So that init container can be removed from helm deployment.

**Values.yaml**

initContainers:
  enabled: false

> helm upgrade my-release -f values.yaml

## Configuration

Configuration

| Parameter                                                                   | Description                                                                                                        | Default                         |
| --------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------| ------------------------------- |
| **ReplicaCount**                                                            |
| `replicaCount`                                                              | Number of Arango pods to be deployed                                                                                               | `1`                             |
| **Namespace**                                                            |
| `namespace`                                                              | Namespace where application to be deployed                                                                                              | `nil`                             |
| **Environment**                                                            |
| `env`                                                              | Environment Label where application to be deployed                                                                                              | `nil`                             |
| **Name**                                                            |
| `Name`                                                              |  Application Name to be deployed                                                                                             | `nil`                             |
| **Image**                                                                   |
| `image.registry`                                                          |  Image registry name                                                                                                    | `nil`                   |
| `image.tag`                                                                   |  Image tag                                                                                                     | `nil`                        |
| `image.pullPolicy`                                                          |  Image pull policy                                                                                             | `nil`                  |
| `image.pullSecretName`                                                          |  Image pull secret name                                                                                          | `nil`                           |
| `image.usePullSecret`                                                          |  pull secret required or not. If required make it to true                                                                                           | `nil`                           |
| **SecurityContext**                                                         |
| `securityContext.runAsUser`                                                 |  User ID for containerized process User                                                                                                   | `nil`                          |
| `securityContext.fsGroup`                                                   |   Group ID for containerized process Group                                                                                                  | `nil`                          |
| `securityContext.runAsGroup`                                                   |  Group ID for containerized process                               | `nil`                          |
| **Environment Variables**
| `envvar`                                                   | Additional environment variables for the nifi-container of properities name and value                               | `nil`                          |
| **Service**                                                                     |
| `service.annotations`                                                            | ADD Annotation If LoadBalancer InternalIP set to true                                                                                 | `nil`                         |
| `service.type`    | service type |  `ClusterIP`  |
| `service.loadbalancerInternal_IP`       | Set to true when need to use Internal LoadBalancer IP | `nil` |
| `service.staticIP`                | Set to true when need to use static LoadBalancer IP                                               | `nil`                            |
| `service.staticLoadBalancerIp`                |  use static LoadBalancer IP  when required                      | `nil`                            |
| `service.loadBalancerSourceRanges`                                                   | Set when need to use LoadBalancer Source IP Ranges                                                                                      | `[]`                      |
| `service.name`    | Service Name                               | `nil`                          |
| `service.ports    `                                                       | service ports to be opened                        | `[]`                            |
| **Init containers used here to change pvc volume ownership to arangodb user**
| `initContainers.enabled`   |  Set to true when need to use init containers              | `nil`                           |
| `initContainers.name`   | Init Container name               | `init`                           |
| `initContainers.image`   | Init Container image                | `busybox:latest`                           |
| `initContainers.command`   | Init Container command to be executed when the container is launched                | ``                           |
| `initContainers.arguments`   | Init Container Arguments to the  command to be executed when the container is launched                | ``                           |
| `initContainers.securityContext.runAsUser`   | Init Container User ID           | ``                           |
| `initContainers.securityContext.volumeMounts.name`   | volume mount name           | ``                           |
| `initContainers.securityContext.volumeMounts.mountpath`   | volume mount path           | ``                           |
| **containers**
| `containers.name`   | Container Name               | `arango`                           |
| `containers.ports`   | Container ports                | `[]`                           |
| **probes**
| `probes`                                                                | Readiness and Liveliness probes need to be configured if required            | `nil`                           |
| **Resources**
| `resources`                            | Pod resource requests and limits            | `nil`                           |
| **volumeClaimTemplates**
| `volumeClaimTemplates.enabled`                            | If volumeClaimTemplates needed set enable to true            | `nil`                           |
| `volumeClaimTemplates.claim`                            | volumeClaimTemplates is a list accepts pvc claims with properities of name and size         | `[]`                           
| **volumemounts**
| `volumemounts.enabled`                            | If volumemounts needed set enable to true            | `nil`                           |
| `volumemounts.mount`                            | volumemounts is a list accepts volume mounts with properities name and mountpath           | `[]`                     |
