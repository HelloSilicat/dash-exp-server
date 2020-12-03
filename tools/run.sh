# Nginx
cd dash-exp-server
kill -9 $(pgrep nginx)
sudo nginx -p . -c ./nginx/nginx.conf
cd ..

# Http server
#cd ../Data/Video

if [ ! -d "/mnt/sdc/Video" ]; then
  if [ ! -d "/dev/vdb1" ]
  then
    mount /dev/vdb1 /mnt/sdc
  else
    mount /dev/sdb1 /mnt/sdc
  fi
fi

#cd /mnt/sdc/Video
#nohup python3.7 http_server.py  9991 >> test.log 2>&1 &

# go to wireshark
cd ~/Workspace/Wireshark
