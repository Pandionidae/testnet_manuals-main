echo -e "\e[1m\e[32mExtracting node identity details \e[0m" 
source $HOME/.bash_profile
if [ "$KEY" ] && [ "$PEER_ID" ]; then
    echo -en "\n"
    echo "=================================================="
    echo -e "\e[1m\e[32m1. Your upstream peer details. You can share your peer info with other users \e[0m" 
    echo -e ' 
'$PEER_ID':
    addresses: 
    - "/ip4/'$(ip route get 8.8.8.8 | sed -n "/src/{s/.*src *\([^ ]*\).*/\1/p;q}")'/tcp/6180/ln-noise-ik/'$PEER_ID'/ln-handshake/0" 
    role: "Upstream"'
    echo -en "\n"
    echo "=================================================="
    echo -e "\e[1m\e[32m2. Make sure you have backed up your identity keys! \e[0m" 
    echo -en "\n"
    echo -e "\e[1m\e[32mPeer Id: \e[0m"$PEER_ID
    echo -e "\e[1m\e[32mPrivate Key: \e[0m"$KEY
    echo -en "\n"
else
    echo -e "\e[1m\e[32mCan't find identity keys \e[0m" 
fi
