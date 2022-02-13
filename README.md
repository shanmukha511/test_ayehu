# Helm Chart for Apache NiFi

## Introduction

This Helm chart installs Apache NiFi 1.14.0 in a Kubernetes cluster.

## Prerequisites

- Kubernetes cluster 1.10+
- Helm 3.0.0+

## Installation

### Install the chart

Install the nifi helm chart with a release name my-release:

helm install my-release nifi/


## Uninstallation

To uninstall/delete the my-release deployment:

helm uninstall my-release

## Configuration

Configuration

| Parameter                                                                   | Description                                                                                                        | Default                         |
| --------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------| ------------------------------- |
| **ReplicaCount**                                                            |
| `replicaCount`                                                              | Number of nifi nodes                                                                                               | `1`                             |
| **Namespace**                                                            |
| `namespace`                                                              | Namespace where application will be deployed                                                                                              | `nil`                             |
| **Environment**                                                            |
| `env`                                                              | Environment Label where application will be deployed                                                                                              | `nil`                             |
| **Name**                                                            |
| `Name`                                                              |  Application will be deployed                                                                                             | `nil`                             |
| **Image**                                                                   |
| `image.registry`                                                          | nifi Image name                                                                                                    | `nil`                   |
| `image.tag`                                                                   | nifi Image tag                                                                                                     | `nil`                        |
| `image.pullPolicy`                                                          | nifi Image pull policy                                                                                             | `nil`                  |
| `image.pullSecretName`                                                          | nifi Image pull secret                                                                                             | `nil`                           |
| `image.usePullSecret`                                                          | nifi pull secret required or not                                                                                             | `nil`                           |
| **SecurityContext**                                                         |
| `securityContext.runAsUser`                                                 | nifi Docker User                                                                                                   | `nil`                          |
| `securityContext.fsGroup`                                                   | nifi Docker Group                                                                                                  | `nil`                          |
| `securityContext.runAsGroup`                                                   | nifi Docker Group                               | `nil`                          |
| **Environment Variables**
| `envvar.name`                                                   | Environment Variable Name                            | `nil`                          |
| `envvar.value`                                                   | Environment Variable value                            | `nil`                          |
| **Service**                                                                     |
| `service.annotations`                                                            | ADD Annotation If LoadBalancer InternalIP set to true                                                                                 | `nil`                         |
| `service.type`    | `ClusterIP` | Service type  |
| `service.loadbalancerInternal_IP`       | Set to true when need to use Internal LoadBalancer IP | `nil` |
| `service.staticIP`                | Set to true when need to use static LoadBalancer IP                                               | `nil`                            |
| `service.staticLoadBalancerIp`                |  use static LoadBalancer IP                        | `nil`                            |
| `service.loadBalancerSourceRanges`                                                   | Set when need to use LoadBalancer Source IP Ranges                                                                                      | `nil`                      |
| `service.name`    | Service Name                               | `nil`                          |
| `service.portname`            | Service Port Name                         | `nil`                          |
| `service.ports    `                                                       | service ports to be opened                        | `[]`                            |
| **containers**
| `containers.name`   | Container Name               | `nil`                           | 
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
| `volumemounts.mount`                            | volumemounts is a list accepts volume mounts with properities name and mountpath           | `nil`                     |
