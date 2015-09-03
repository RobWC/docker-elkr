.PHONY: all

all: compose

compose:

volumes:
	docker build -f Dockerfile-ESDATA -t esdata .
	
clean:

