hasWallet=$(bitcoin-cli -regtest -conf=/bitcoin/bitcoin.conf listwallets | jq -e '.[]')
if [ -z "$hasWallet" ]; then
    echo "Create wallet..."
    bitcoin-cli -regtest -conf=/bitcoin/bitcoin.conf -named createwallet wallet_name="bitcoin-wallet-regtest" load_on_startup=true
else
    echo "Already created wallet!"
fi