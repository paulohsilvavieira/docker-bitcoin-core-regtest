FROM debian:bullseye-slim

LABEL maintainer.0="Paulo Henrique  (@paulohsilvavieira)"

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

WORKDIR /

RUN rm -rf bitcoin_download

WORKDIR /scripts

COPY /scripts/createwallet.sh createwallet.sh

COPY /scripts/automining.sh automining.sh

RUN chmod +x createwallet.sh

RUN chmod +x automining.sh

WORKDIR /root

RUN echo "alias automining='nohup /scripts/automining.sh > /bitcoin/automining.log 2>&1 &'" >> .bashrc

RUN echo "alias createwallet='/scripts/createwallet.sh'" >> .bashrc

WORKDIR /bitcoin

COPY bitcoin.conf .

EXPOSE 18445 18333 18444 38333 29000

CMD ["bitcoind", "-conf=/bitcoin/bitcoin.conf"]

