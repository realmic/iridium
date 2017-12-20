FROM realmicprojects/iridium:latest

EXPOSE 8082

ENV WALLETFILE wallet.bin
ENV DAEMON_ADDR 127.0.0.1

CMD /opt/iridium_bin/walletd --data-dir /opt/iridium_data -w "/opt/iridium_data/$WALLETFILE" --bind-port 8082 -p "$PASSWORD" --daemon-address "$DAEMON_ADDR"
