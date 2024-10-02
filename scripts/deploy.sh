#!/bin/bash
sleep 1
echo " "
echo " "
echo "installing plugin ... "
echo " "

bin/logstash-plugin install logstash-output-syslog

sleep 1

echo " "
echo "config stuff ..."
echo " "

curl https://raw.githubusercontent.com/chrisjbawden/log-to-syslog/refs/heads/main/config/logstash.conf -o /usr/share/logstash/pipeline/logstash.conf 

echo " "

echo "xpack.monitoring.enabled: false" | tee -a /usr/share/logstash/config/logstash.yml

sleep 1
echo " "


