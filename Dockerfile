FROM tezos/tezos:v8.2

# Install AWS CLI

USER root
RUN \
	apk -Uuv add groff less python3 py3-pip curl jq && \
	pip3 install awscli six && \
	apk --purge -v del py3-pip && \
	rm /var/cache/apk/*

COPY ./start-updater.sh /home/tezos/start-updater.sh
RUN chmod 755 /home/tezos/start-updater.sh

USER tezos
EXPOSE 8732 9732
ENTRYPOINT ["/home/tezos/start-updater.sh"]
