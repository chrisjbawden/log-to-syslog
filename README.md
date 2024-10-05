"Log to Syslog" is a tool designed to facilitate the transfer of log files into a centralized syslog server. By monitoring specified directories for log files, it captures the logs and forwards them to a remote syslog server in real-time, making it easier to centralize, manage, and analyze logs across multiple systems. This solution targets scenarios where existing solution lack in-built syslog functionality to facilitate ingestion og log data, allowing for further integration from various sources into a standardized syslog format for streamlined monitoring and alerting.

ie; legacy platform or hardware, in combination of a secheduled cronjob to export logs data via ssh to a file in the monitored directory of the logstash docker instace, it will be automatically ingested. Serving as a somewhat broker.

Simple deployment - 
```
curl -sl https://raw.githubusercontent.com/chrisjbawden/log-to-syslog/refs/heads/main/scripts/simple-deploy.sh -o simple-deploy.sh && bash simple-deploy.sh
```
