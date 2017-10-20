set -e

echo "password" | sudo -S mkdir /mnt/test1

sudo deluser $NB_USER sudo

#echo "password" | sudo -S mount -t cifs //dockeraustraliasoutheast.file.core.windows.net/e38f34ea-a82a-47a1-859f-399600cd2ad9 /home/jovyan/test1 -o vers=3.0,username=dockeraustraliasoutheast,password=CHhgeEf13Vpn8V+8rQWvfBFGYU7w5ECyBxmwp35iP+6JSoorLJD1wWywSwwXd2AANLn+kKMbcBq29r1pR/ztrA==,dir_mode=0777,file_mode=0777,sec=ntlmssp

#jupyter notebook $*

exec sudo su $NB_USER -c "env PATH=$PATH jupyter notebook $*"
