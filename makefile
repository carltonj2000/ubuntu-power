DOCKER_IMG = ubuntu-power
DOCKER_INST = ubuntu-power1

GO = /home/carltonj2000/cj/configsNscripts/go
HTML = /home/carltonj2000/cj/cjSourceControlled/carltonj2000/home-server/build

build:
	docker build -t $(DOCKER_IMG) .

run:
	docker run -it --rm --name $(DOCKER_INST) -p 8111:8111 \
	-v $(GO):$(GO) \
	-v $(HTML):/root/html \
		$(DOCKER_IMG)

clean:
	docker rm -f $(shell docker ps -a | grep $(DOCKER_INST) | cut -b 1-12)

stopnrun: stopnrun1

stopnrun1: stopnrun2 run

stopnrun2: stopnrun3 build

stopnrun3: clean
