FROM ubuntu:latest

RUN apt update -y && apt upgrade -y

RUN apt install -y\
  software-properties-common git curl make jq wget\
  build-essential libtool autotools-dev\
  automake pkg-config libssl-dev libevent-dev bsdmainutils\
  python3 libboost-system-dev libboost-filesystem-dev\
  libboost-chrono-dev libboost-program-options-dev libboost-test-dev\
  libboost-thread-dev libboost-dev\
  libsqlite3-dev libminiupnpc-dev libnatpmp-dev libzmq3-dev\
  && apt clean

WORKDIR /bitcoin_download

RUN wget https://bitcoincore.org/bin/bitcoin-core-25.0/bitcoin-25.0-x86_64-linux-gnu.tar.gz

RUN tar xf bitcoin-25.0-x86_64-linux-gnu.tar.gz -C .

WORKDIR /bitcoin_download/bitcoin-25.0

RUN mv ./bin/* /usr/bin

WORKDIR /usr/bin

RUN ls -la

WORKDIR /bitcoin

COPY . .

RUN chmod +x /scripts/createwallet.sh
RUN chmod +x /scripts/automining.sh

RUN touch automining.log

EXPOSE 8333 18332 18333 8332 18443 8443

CMD ["bitcoind", "-conf=/bitcoin/bitcoin.conf"]

