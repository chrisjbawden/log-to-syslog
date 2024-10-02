#!/bin/bash
sleep 1
echo ""

echo "installing plugin ... "
echo""

bin/logstash-plugin install logstash-output-syslog

sleep 1

echo ""
echo "grabing config ..."
echo ""

curl https://raw.githubusercontent.com/chrisjbawden/log-to-syslog/refs/heads/main/config/logstash.conf -o /usr/share/logstash/pipeline/logstash.conf 

sleep 1
echo ""
echo "starting logstash ..."
echo ""

bin/logstash -f /usr/share/logstash/pipeline/logstash.conf 

