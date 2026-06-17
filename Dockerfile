FROM alpine:latest
 # Install dependencies and Xray-core
 RUN apk add --no-cache bash ca-certificates wget unzip && \
     wget -qO xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip && \
     unzip xray.zip -d /usr/local/bin/ && \
     rm xray.zip && \
     chmod +x /usr/local/bin/xray && \
     update-ca-certificates
 WORKDIR /app
 COPY config.json /app/
 COPY entrypoint.sh /app/
 RUN chmod +x /app/entrypoint.sh
 EXPOSE 443/tcp
 CMD ["/app/entrypoint.sh"]
