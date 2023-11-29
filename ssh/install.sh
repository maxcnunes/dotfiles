mkdir -p ~/Development
mkdir -p ~/.ssh

chmod 700 ~/.ssh

echo "
Host *
  IdentityAgent \"~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock\"
" > ~/.ssh/config

# ssh-add
