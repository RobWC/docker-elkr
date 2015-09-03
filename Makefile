.PHONY: all

all: volumes compose

compose:
	docker-compose up -d
	
volumes:
	docker create -v /usr/share/elasticsearch/data --name esdata elasticsearch /bin/true
	
clean:
	@echo "Removing all contianers"
	docker rm $(docker ps -a |  cut -d " " -f 1 | grep -o -w '\w\{12\}')
