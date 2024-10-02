#!/bin/bash
sleep 1

bin/logstash-plugin install logstash-output-syslog

sleep 1

curl https://raw.githubusercontent.com/chrisjbawden/log-to-syslog/refs/heads/main/config/logstash.conf -o /usr/share/logstash/pipeline/logstash.conf 

sleep 1

bin/logstash
