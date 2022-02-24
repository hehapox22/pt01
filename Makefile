#Dockerfile vars

#vars
IMAGENAME=ubuntu-sshd
USER=ubuntu
PORT=2022
SSHKEY=id_ed25519


#.ONESHELL:
.PHONY: help build run all

help:
	    @echo "Makefile arguments:"
	    @echo ""
	    @echo "ssh -l $(USER) -p $(PORT) -i /home/$(USER)/.ssh/$(SSHKEY) <HOST>"
	    @echo ""
	    @echo "Makefile commands:"
	    @echo "build"
	    @echo "run"
			@echo "stop"
			@echo "clean"
	    @echo "all"

.DEFAULT_GOAL := all

build:
	    @sudo docker build -f Dockerfile -t $(IMAGENAME) .

build-key:
			@ssh-keygen -o -a 100 -t ed25519 -f /home/$(USER)/.ssh/$(SSHKEY)

run:
	    @sudo docker run -it --rm -d -p $(PORT):22 --name $(IMAGENAME) -v /home/$(USER)/.ssh/$(SSHKEY).pub:/home/$(USER)/.ssh/authorized_keys:ro $(IMAGENAME)

stop:
			@sudo docker stop $(IMAGENAME)

clean:
			@sudo docker rmi $(IMAGENAME)

all: build run
