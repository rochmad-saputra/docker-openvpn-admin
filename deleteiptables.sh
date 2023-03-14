#!/bin/bash
#sleep 20
set -x


if nc -z -v 172.19.0.1 -u 53  &> /dev/null; then
    if nslookup google.com 10.26.0.1  &> /dev/null ; then
        if docker ps | grep docker-openvpn-admin-php-fpm-1 &> /dev/null; then

        nslookup google.com 10.26.0.1
        iptables -t nat -L DOCKER --line-numbers

        for i in {1..10}; do

            for i in $(iptables -t nat -L DOCKER --line-numbers | grep "53" | awk '{print $1}'); do iptables -t nat -D DOCKER $i ; done
            #for i in $(iptables -t nat -L --line-numbers | grep "53" | awk '{print $1}'); do while ! iptables -t nat -D DOCKER $i ; do sleep 2; done ; done

            #for i in $(iptables -t nat -v -L POSTROUTING -n --line-number | grep "53" | awk '{print $1}'); do iptables -t nat -D POSTROUTING $i; done
            #for i in $(iptables -t nat -v -L POSTROUTING -n --line-number | grep "53" | awk '{print $1}'); do while ! iptables -t nat -D POSTROUTING $i ; do sleep 2; done ; done

            #for i in $(iptables -L DOCKER --line-number | grep "domain" | awk '{print $1}'); do iptables -D DOCKER $i ; done
            #for i in $(iptables -L DOCKER --line-number | grep "domain" | awk '{print $1}'); do while ! iptables -D DOCKER $i ; do sleep 2 ; done  ; done

            sleep 2
            done

        fi

    fi

fi
