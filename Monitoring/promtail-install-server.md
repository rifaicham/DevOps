## check version promtail 
```
https://github.com/grafana/loki/releases/
```

## Download promtail
```
curl -O -L "https://github.com/grafana/loki/releases/download/v2.4.1/promtail-linux-amd64.zip"
```

## extract the binary
```
unzip "promtail-linux-amd64.zip"
```

## make sure it is executable
```
chmod a+x "promtail-linux-amd64"
```

## copy binary to /usr/local/bin/
```
sudo cp promtail-linux-amd64 /usr/local/bin/promtail
```

## verify installation by checking version
```
promtail --version
```
## create dir in /etc
```
sudo mkdir -p /etc/promtail /etc/promtail/logs
```

## Create config
```
cd /etc/promtail
sudo nano promtail-config.yaml
```
```
server:
  http_listen_port: 9080
  grpc_listen_port: 0

positions:
  filename: /etc/promtail/positions.yaml

clients:
  - url: http://localhost:3100/loki/api/v1/push

scrape_configs:
- job_name: nginx
  static_configs:
  - targets:
      - localhost[Unit] 
Description=Promtail service 
After=network.target 
```

## Create a file called promtail.service
```
sudo nano /etc/systemd/system/promtail.service
```

```
[Unit] 
Description=Promtail service 
After=network.target 
 
[Service] 
Type=simple 
User=root 
ExecStart=/usr/local/bin/promtail -config.file /etc/promtail/promtail-config.yaml 
Restart=on-failure 
RestartSec=20 
StandardOutput=append:/etc/promtail/logs/promtail.log 
StandardError=append:/etc/promtail/logs/promtail.log 
 
[Install] 
WantedBy=multi-user.target
```

## check status
```
sudo systemctl daemon-reload #To reload systemd
sudo systemctl start promtail #to start promtail
sudo systemctl status promtail #to check status
sudo systemctl restart promtail #to restart
```
