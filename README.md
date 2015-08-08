# docker-kler
Kibana LogStash ElasticSearch Redis Docker Stack

#docker containers
-   logstash
-   elasticsearch
-   kibana

#docker run commands

```
#redis
docker run -d --name redis redis

#elasticsearch
docker run -d --name elasticsearch elasticsearch elasticsearch -Des.node.name="ESNode"

#logstash central
docker run -d --link elasticsearch:es --name logstash_central -p 514:5514 -p 514:5514/udp logstash /docker-entrypoint.sh logstash -e "input { syslog { port => 5514 type => syslog } } output { stdout { } elasticsearch { host => \"es\" }}"

#kibana
docker run --name kibana --link elasticsearch:elasticsearch -p 5601:5601 -d kibana

docker@boot2docker:~$ docker ps
CONTAINER ID        IMAGE               COMMAND                CREATED             STATUS              PORTS                                          NAMES
71e3729052c4        logstash            "/docker-entrypoint.   49 seconds ago      Up 49 seconds       0.0.0.0:514->5514/udp, 0.0.0.0:514->5514/tcp   logstash_central
b2a3a11b4aef        kibana              "/docker-entrypoint.   21 minutes ago      Up 21 minutes       0.0.0.0:5601->5601/tcp                         kibana
bf07a513f250        elasticsearch       "/docker-entrypoint.   3 hours ago         Up 3 hours          9200/tcp, 9300/tcp                             elasticsearch                            elasticsearch
```
