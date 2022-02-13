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

| **nifi properties**                                                         |
| `properties.algorithm`                                                 | [Encryption method](https://nifi.apache.org/docs/nifi-docs/html/administration-guide.html#nifi_sensitive_props_key)                                                                                | `NIFI_PBKDF2_AES_GCM_256`                         |
| `properties.sensitiveKey`                                                 | [Encryption password](https://nifi.apache.org/docs/nifi-docs/html/administration-guide.html#nifi_sensitive_props_key) (at least 12 characters)                                                                                | `changeMechangeMe`                         |
| `properties.externalSecure`                                                 | externalSecure for when inbound SSL                                                                                | `false`                         |
| `properties.isNode`                                                         | cluster node properties (only configure for cluster nodes)                                                         | `true`                          |
| `properties.httpPort`                                                       | web properties HTTP port                                                                                           | `8080`                          |
| `properties.httpsPort`                                                      | web properties HTTPS port                                                                                          | `null`                          |
| `properties.clusterPort`                                                    | cluster node port                                                                                                  | `6007`                          |
| `properties.provenanceStorage`                                              | nifi provenance repository max storage size                                                                        | `8 GB`                          |
| `properties.siteToSite.secure`                                              | Site to Site properties Secure mode                                                                                | `false`                         |
| `properties.siteToSite.port`                                                | Site to Site properties Secure port                                                                                | `10000`                         |
| `properties.safetyValve`                                                    | Map of explicit 'property: value' pairs that overwrite other configuration                                         | `nil`                           |
| `properties.customLibPath`                                                  | Path of the custom libraries folder                                                                                | `nil`                           |
| `properties.webProxyHost`                               | Proxy to access to Nifi through the cluster ip address    | `Port:30236`
| **[Authentication](/doc/USERMANAGEMENT.md)**                                                |
| **Single-user authentication**                                                | Automatically disabled if OIDC or LDAP enabled
| `auth.singleUser.username`                                                                | Single user identity                                                                                             | `username`            |
| `auth.singleUser.password`                                                         | Single user password                                                                                          | `changemechangeme`                         |
| **Ldap authentication**                                                |
| `auth.admin`                                                                | Default admin identity                                                                                             | ` CN=admin, OU=NIFI`            |
| `auth.ldap.enabled`                                                         | Enable User auth via ldap                                                                                          | `false`                         |
| `auth.ldap.host`                                                            | ldap hostname                                                                                                      | `ldap://<hostname>:<port>`      |
| `auth.ldap.searchBase`                                                      | ldap searchBase                                                                                                    | `CN=Users,DC=example,DC=com`    |
| `auth.ldap.searchFilter`                                                    | ldap searchFilter                                                                                                  | `CN=john`                       |
| **Oidc authentication**
| `auth.oidc.enabled`                                                         | Enable User auth via oidc                                                                                          | `false`                         |
| `auth.oidc.discoveryUrl`                                                    | oidc discover url                                                                                                  | `https://<provider>/.well-known/openid-configuration`      |
| `auth.oidc.clientId`                                                        | oidc clientId                                                                                                      | `nil`                           |
| `auth.oidc.clientSecret`                                                    | oidc clientSecret                                                                                                  | `nil`                           |
| `auth.oidc.claimIdentifyingUser`                                            | oidc claimIdentifyingUser                                                                                          | `email`                         |
| `auth.oidc.admin`                                                           | Default OIDC admin identity                                                                                        | `nifi@example.com`              |
| **postStart**                                                               |
| `postStart`                                                                 | Include additional libraries in the Nifi containers by using the postStart handler                                 | `nil`                           |
| **Headless Service**                                                        |
| `headless.type`                                                             | Type of the headless service for nifi                                                                              | `ClusterIP`                     |
| `headless.annotations`                                                      | Headless Service annotations                                                                                       | `service.alpha.kubernetes.io/tolerate-unready-endpoints: "true"`|
| **UI Service**                                                              |
| `service.type`                                                              | Type of the UI service for nifi                                                                                    | `NodePort`                  |
| `service.httpPort`                                                          | Port to expose service                                                                                             | `8080`                            |
| `service.httpsPort`                                                         | Port to expose service in tls                                                                                      | `443`                           |
| `service.annotations`                                                       | Service annotations                                                                                                | `{}`                            |
| `service.loadBalancerIP`                                                    | LoadBalancerIP if service type is `LoadBalancer`                                                                   | `nil`                           |
| `service.loadBalancerSourceRanges`                                          | Address that are allowed when svc is `LoadBalancer`                                                                | `[]`                            |
| `service.processors.enabled`                                                | Enables additional port/ports to nifi service for internal processors                                              | `false`                         |
| `service.processors.ports`                                                  | Specify "name/port/targetPort/nodePort" for processors  sockets                                                    | `[]`                            |
| **Ingress**                                                                 |
| `ingress.enabled`                                                           | Enables Ingress                                                                                                    | `false`                         |
| `ingress.annotations`                                                       | Ingress annotations                                                                                                | `{}`                            |
| `ingress.path`                                                              | Path to access frontend (See issue [#22](https://github.com/cetic/helm-nifi/issues/22))                            | `/`                             |
| `ingress.hosts`                                                             | Ingress hosts                                                                                                      | `[]`                            |
| `ingress.tls`                                                               | Ingress TLS configuration                                                                                          | `[]`                            |
| **Persistence**                                                             |
| `persistence.enabled`                                                       | Use persistent volume to store data                                                                                | `false`                         |
| `persistence.storageClass`                                                  | Storage class name of PVCs (use the default type if unset)                                                         | `nil`                           |
| `persistence.accessMode`                                                    | ReadWriteOnce or ReadOnly                                                                                          | `[ReadWriteOnce]`               |
| `persistence.configStorage.size`                                            | Size of persistent volume claim                                                                                    | `100Mi`                         |
| `persistence.authconfStorage.size`                                          | Size of persistent volume claim                                                                                    | `100Mi`                         |
| `persistence.dataStorage.size`                                              | Size of persistent volume claim                                                                                    | `1Gi`                           |
| `persistence.flowfileRepoStorage.size`                                      | Size of persistent volume claim                                                                                    | `10Gi`                          |
| `persistence.contentRepoStorage.size`                                       | Size of persistent volume claim                                                                                    | `10Gi`                          |
| `persistence.provenanceRepoStorage.size`                                    | Size of persistent volume claim                                                                                    | `10Gi`                          |
| `persistence.logStorage.size`                                               | Size of persistent volume claim                                                                                    | `5Gi`                           |
| `persistence.existingClaim`                                                 | Use an existing PVC to persist data                                                                                | `nil`                           |
