# Install Loki
## Download Loki binary 
https://github.com/grafana/loki/releases/
```
curl -O -L "https://github.com/grafana/loki/releases/download/v2.4.1/loki-linux-amd64.zip"
```

## extract the binary
```
unzip "loki-linux-amd64.zip"
```

## make sure it is executable
```
chmod a+x "loki-linux-amd64"
```

## copy binary to /usr/local/bin/
```
sudo cp loki-linux-amd64 /usr/local/bin/loki
```

## verify installation by checking version
```
loki --version
```

# Now, it’s time create config file for Loki.

## create user for loki
``` 
sudo useradd --system loki
```

## create dir in /etc
```
sudo mkdir -p /etc/loki /etc/loki/logs
```

## default loki config file
```
sudo curl -o /etc/loki/loki-local-config.yaml -L "https://gist.github.com/psujit775/ceaf475fc369e25a2d04501f8a7c0a59/raw"
```

## change permissions
```
sudo chown -R loki: /etc/loki
```

# Configure Loki to run as a service.

## Create a file called loki.service
```
sudo nano /etc/systemd/system/loki.service
```
```
[Unit] 
Description=Loki service 
After=network.target 
 
[Service] 
Type=simple 
User=loki 
ExecStart=/usr/local/bin/loki -config.file /etc/loki/loki-local-config.yaml 
Restart=on-failure 
RestartSec=20 
StandardOutput=append:/etc/loki/logs/loki.log 
StandardError=append:/etc/loki/logs/loki.log 
 
[Install] 
WantedBy=multi-user.target
Run below command to start loki as a service.
```
## test service

```
sudo systemctl daemon-reload #To reload systemd
sudo systemctl start loki #to start loki
sudo systemctl status loki #to check status
sudo systemctl restart loki #to restart
```

# Enable Loki on system boot.
```
sudo systemctl enable loki.service
```

To Check metrics received by loki. Open browser and type http://localhost:3100/metrics
