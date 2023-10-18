# Usage: docker container run --name airspy-server --device /dev/bus/usb -p 5555:5555 skl256/airspy-server:latest

FROM debian:11.7-slim

LABEL version="1.0" \
	maintainer="t.me/skl256" \
	description="Airspy server for SDRSharp" \
	links="https://airspy.com/quickstart/ https://github.com/airspy/airspyone_host#how-to-build-the-host-software-on-linux"

WORKDIR /opt/airspy-server

COPY . .

RUN apt update -y && apt install -y build-essential cmake libusb-1.0-0-dev pkg-config unzip rtl-sdr librtlsdr-dev && \
	rm -rf /var/lib/apt/lists/*

RUN unzip airspyone_host-master.zip && \
	cd airspyone_host-master && \
	mkdir -p build && \
	cd build && \
	cmake ../ -DINSTALL_UDEV_RULES=ON && \
	make && \
	make install && \
	ldconfig && \
	rm -rf * && \
	cd ../..

RUN tar xvf spyserver-linux-x64.tgz

RUN rm airspyone_host-master.zip spyserver-linux-x64.tgz

ENTRYPOINT ["./spyserver", "spyserver.config"]
