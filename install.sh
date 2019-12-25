#https://www.linode.com/docs/quick-answers/linux/start-service-at-boot/
sudo cp ubuntu-battery-alarm-service.sh /usr/bin
sudo chmod +x /usr/bin/ubuntu-battery-alarm-service.sh 
sudo cp ubuntu-battery-status.service /etc/systemd/system/ubuntu-battery-status.service
sudo chmod 644 /etc/systemd/system/ubuntu-battery-status.service

sudo systemctl start ubuntu-battery-status
sudo systemctl status ubuntu-battery-status
sudo systemctl enable ubuntu-battery-status
