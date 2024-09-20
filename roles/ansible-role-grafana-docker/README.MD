# Ansible Role: Grafana in Docker

This role will deploy Grafana with PostgreSQL and rendering plugin in Docker. Also, file provisioning is available.

### Requirements
  - Installed Docker on selected host

### Example playbook

```yaml
---
- hosts: all
  become: true
  roles: 
    - ansible-role-grafana-docker
```


### Variables

All variables is shown in `defaults/main.yml` file.

By default the role will install Grafana in `/opt/grafana` directory with provisioning disabled.

### Provisioning

Provisioning is disabled by default. You can enable it by setting `grafana_provisioning` to `true`.

Role will provision dashboards, alerts, datasources, message template (doesn't editable), notification policies and contact points.

Provisioning files (except dashboards, alerts and message template) are located in inventory variabled: `grafana_datasources`, `grafana_contact_points`, `grafana_notification_policies`. Check Grafana docs to edit them.

Dashboards and alerts can be selected from files, located at `files/alerts` and `files/dashboards` directories. You can add your own dashboards and alerts to these directories. To enable them, add their names to `grafana_dashboards` and `grafana_alerts` variables.

### Remove Grafana `provisioned` tag
1. Remove provisioned files (but keep directories) except `dashboards`.
2. Open Grafana database and run this query:
```sql
UPDATE provenance_type
SET provenance = ''
```
3. Restart Grafana


## About

### Alerts

These alerts are a slightly modified version of alerts from the [Awesome Prometheus] (https://samber.github.io/awesome-prometheus-alerts/) project. They are linked to the dashboards in this repo.

### Dashboards

Some dashboards are slightly modified, they have a `_mod` suffix.

### Message template

This repo contains a message template for RocketChat.
This template assumes that alerts have a `severity' label. Alerts with severity `info' don't have an `@all' tag to avoid extra notifications. It's also recommended to use this template with 2 contact points: one with resolved message and one without.

### Credits

* [Awesome Prometheus](https://samber.github.io/awesome-prometheus-alerts/)
* [Blackbox exporter dashboard](https://grafana.com/grafana/dashboards/14928-prometheus-blackbox-exporter/)
* [Centrifugo dashboard](https://grafana.com/grafana/dashboards/13039-centrifugo/)
* [Clickhouse dashboard](https://grafana.com/grafana/dashboards/14192-clickhouse/)
* [Docker dashboard](https://grafana.com/grafana/dashboards/1229)
* [HaProxy dashboard](https://grafana.com/grafana/dashboards/367)
* [MinIO dashboard](https://grafana.com/grafana/dashboards/13502-minio-dashboard/)
* [Percona dashboards](https://github.com/percona/grafana-dashboards/)
* [NginxLog dashboard](https://grafana.com/grafana/dashboards/6482)
* [Node exporter dashborard](https://grafana.com/grafana/dashboards/1860-node-exporter-full/)
* [OpenVPN dashboard](https://grafana.com/grafana/dashboards/12140)
* [Prometheus dashboard](https://grafana.com/grafana/dashboards/3662)
* [RabbitMQ detailed dashboard](https://grafana.com/grafana/dashboards/4279)
* [RabbitMQ overview dashborad](https://grafana.com/grafana/dashboards/10991-rabbitmq-overview/)
* [Redis dashboard](https://grafana.com/grafana/dashboards/763)
