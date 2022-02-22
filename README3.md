# Helm Chart for Apache NiFi

## Introduction

This Helm chart installs Apache NiFi  in a Kubernetes cluster.

## Prerequisites

- Kubernetes cluster 1.10+
- Helm 3.0.0+

## Installation

### Install the chart

Install the nifi helm chart with a release name my-release:

> helm install my-release nifi/

## Install with custom values.yaml

> helm install my-release nifi/ -f custom-values.yaml


## Uninstallation

To uninstall/delete the my-release deployment:

> helm uninstall my-release

## Configuration

Configuration

| Parameter                                                                   | Description                                                                                                        | Default                         |
| --------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------| ------------------------------- |
| **ReplicaCount**                                                            |
| `replicaCount`                                                              | Number of nifi pods to be deployed                                                                                               | `1`                             |
| **Namespace**                                                            |
| `namespace`                                                              | Namespace where application to be deployed                                                                                              | `nil`                             |
| **Environment**                                                            |
| `env`                                                              | Environment Label where application to be deployed                                                                                              | `nil`                             |
| **Name**                                                            |
| `Name`                                                              |  Application Name to be deployed                                                                                             | `nifi`                             |
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
| `service.portname`            | Service Port Name                         | `nil`                          |
| `service.ports    `                                                       | service ports to be opened                        | `[]`                            |
| **containers**
| `containers.name`   | Container Name               | `nifi`                           |
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
