[![CircleCI](https://circleci.com/gh/giantswarm/esrally-app.svg?style=shield)](https://circleci.com/gh/giantswarm/esrally-app)

# esrally-app chart

Giant Swarm offers an esrally Managed App which can be installed in tenant clusters.
Here we define the esrally chart with its templates and default configuration.

## Configuration

This chart requires job config variables to be present in a secret prior to running. These
are:

- `target`
  - The hostname:port service address for the `es-client` service. Usually `opendistro-es-client-service:9200`.
- `track`
  - Test scenario to run. Use `esrally list tracks` to see all options.
- `username`
  - The username for authenticating to Elasticsearch.
- `password`
  - The password for authenticating to Elasticsearch.

`values.yaml` allows each variable to be provided in different Secrets. If this isn't configured
then the Chart expects a Secret with the name `esrally-job-config` to be present in the Job's
namespace. See the following for an example:

```yaml
apiVersion: v1
kind: Secret
type: Opaque
metadata:
  name: esrally-job-config
  namespace: efk-stack-app
data:
  target: b3BlbmRpc3Ryby1lcy1jbGllbnQtc2VydmljZTo5MjAwCg==
  track: cGVyY3VsYXRvcgo=
  username: YWRtaW4K
  password: cGFzc3dvcmQK
```

## Credit

* https://github.com/elastic/rally
