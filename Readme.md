# Airspy server for RTL-SDR + SDRSharp / Сервер для удалённого подключения к RTL-SDR приёмнику

## Usage / Использование

1. **Install Docker Engine** / Установите Docker Engine: [docs.docker.com/engine/install/](https://docs.docker.com/engine/install/)
2. **Connect the RTL-SDR receiver via USB** / Подключите RTL-SDR приёмник через USB
3. **Run a container with airspy-server** / Запустите контейнер с airspy-server: `sudo` `docker container run --name airspy-server --device /dev/bus/usb -p 5555:5555 skl256/airspy-server:latest`
4. **Run SDRSharp** / Запустите SDRSharp ([airspy.com](https://airspy.com/)), connect to your airspy-server / подключитесь к вашему airspy-server: Menu -> Source -> AIRSPY Server Network -> `sdr://192.168.100.200:5555/` (где "192.168.100.200" IP адрес, на котором запущен контейнер с airspy-server / where "192.168.100.200" IP of airspy-server host) -> "C"
5. **Have fun :)**

##  Troubleshooting / Решение проблем

* If the RTL-SDR is reconnected to the USB, the container must be restarted manualy / В случае переподключения RTL-SDR к USB разъёму необходим перезапуск контейнера
* If additional configuration is needed (for example, more than one RTL-SDR receiver), you need to edit `spyserver.config` inside the container or build a container with a custom `spyserver.config` / Если необходима дополнительная конфигурация (например, более одного RTL-SDR приёмника) необходимо изменить `spyserver.config` внутри контейнера или собрать контейнер с кастомным `spyserver.config`
* More information can be found in the sources / Дополнительную информацию можно найти в источниках: [airspy.com/quickstart/](https://airspy.com/quickstart/), [github.com/airspy/airspyone_host#how-to-build-the-host-software-on-linux](https://github.com/airspy/airspyone_host#how-to-build-the-host-software-on-linux)
