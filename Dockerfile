FROM tezos/tezos:v8.2

# Install AWS CLI

USER root
RUN \
	apk -Uuv add groff less python3 py3-setuptools curl jq && \
	pip3 install --ignore-installed six && \
	pip3 install --ignore-installed awscli && \
	rm /var/cache/apk/*

COPY ./start-updater.sh /home/tezos/start-updater.sh
RUN chmod 755 /home/tezos/start-updater.sh

USER tezos
EXPOSE 8732 9732
ENTRYPOINT ["/home/tezos/start-updater.sh"]
