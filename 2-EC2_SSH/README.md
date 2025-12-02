Generate the key:
ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa

Save the public key to the env var: 
cat ~/.ssh/id_rsa.pub
export TF_VAR_ssh_key="PASTE_YOUR_PUBLIC_KEY_STRING_HERE"
