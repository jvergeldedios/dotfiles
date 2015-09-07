function connect_vpn
  set network $argv[1]
  set server $argv[2]
  set pwtemp (mktemp -t pwtemp)
  set prevdir $PWD
  cd $HOME/.openvpn/$network
  pass vpn/$network/username >> $pwtemp
  pass vpn/$network/password >> $pwtemp
  touch $HOME/.openvpn/pidfiles/$server
  sudo openvpn --config $server --auth-user-pass $pwtemp &
  echo %2 > $HOME/.openvpn/pidfiles/$server
  sleep 1
  rm $pwtemp
  cd $prevdir
end
