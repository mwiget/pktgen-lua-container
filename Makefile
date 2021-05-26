all: build

build:
	docker build -t pktgen .

run:
	@echo launching dpdk creating dtap0 and dtap1
	(sleep 2 && sudo socat interface:dtap0 interface:dtap1) &
	docker run -ti --net=host -v ${PWD}/scripts:/scripts -v /dev/hugepages/:/dev/hugepages/ --rm --privileged pktgen --socket-mem 512 --no-pci --vdev=net_tap0 --vdev=net_tap1 -- -P -T -m [1:2].0,[3:4].1 -f /scripts/test.lua
