FROM debian:11

RUN apt-get update -y && apt-get install dnsutils curl -y

RUN curl -LO https://harmony.one/hmycli && mv hmycli /usr/local/bin/hmy && chmod +x /usr/local/bin/hmy && \
    curl -LO https://harmony.one/binary_testnet && mv binary_testnet /usr/local/bin/harmony_testnet && chmod +x /usr/local/bin/harmony_testnet

COPY start_docker_process.sh /usr/local/bin/

WORKDIR /root/workspace

EXPOSE 10000
EXPOSE 10500
EXPOSE 10800
EXPOSE 7000

VOLUME [ "/root/workspace/testnet" ]

ENTRYPOINT [ "/bin/bash" ]

CMD ["start_docker_process.sh"]
