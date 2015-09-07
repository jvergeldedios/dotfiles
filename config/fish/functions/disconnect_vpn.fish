function disconnect_vpn
  set network $argv[1]
  set server $argv[2]
  sudo kill (cat $HOME/.openvpn/pidfiles/$server)
  rm $HOME/.openvpn/pidfiles/$server
end
