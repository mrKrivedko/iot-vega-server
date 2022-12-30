FROM python:3.9-slim-buster
WORKDIR /server
COPY iot-vega-server-1.2.1.deb .
COPY ["Admin Tool/", "/opt/iot-vega-server/"]
RUN apt update
RUN apt install nano
RUN apt install -y sudo
RUN sudo dpkg -i iot-vega-server-1.2.1.deb
RUN apt-get install -y libglib2.0-0
RUN rm /opt/iot-vega-server/libcrypto.so.10
RUN rm /opt/iot-vega-server/libssl.so.10
RUN ln -s /usr/lib/x86_64-linux-gnu/libcrypto.so.1.1 libcrypto.so.10
RUN ln -s /usr/lib/x86_64-linux-gnu/libssl.so.1.1 libssl.so.10
RUN ln -s /usr/lib/x86_64-linux-gnu/libgthread-2.0.so.0 libgthread-2.0.so.0
RUN ln -s /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0 libglib-2.0.so.0
RUN sudo /opt/iot-vega-server/iot-vega-server.sh
VOLUME [ "/opt/iot-vega-server/" ]
CMD [ "bash" ]