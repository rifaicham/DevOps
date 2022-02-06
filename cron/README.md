# cron 

## Instalasi
```
ubuntu
---
sudo apt update
sudo apt install cron

untuk arch linux
---
sudo pacman -S cronie
```

## akses crontab
```
crontab -e
```
format
```
# .---------------- menit (0 - 59)
# |  .------------- jam (0 - 23)
# |  |  .---------- hari dalam bulan (1 - 31)
# |  |  |  .------- bulan (1 - 12) ATAU jan,feb,mar,apr ...
# |  |  |  |  .---- hari dalam minggu (0 - 6) (minggu = 0 ATAU 7) ATAU sun,mon,tue,wed,thu,fri,sat
# |  |  |  |  |
# *  *  *  *  * perintah yang ingin dijalankan
```

## Tanggal
format tanggal `tanggal-bulan-tahun@jam:menit` 
```
date '+%d-%m-%Y@%H:%M'
```

## mysql
format untuk backup `mysqldump -u [username] -p[password] [nama-db] > [output-db] .sql` 
contohnya
```
username: root
password: 12345
nama db: mydb
nama output file: mydb_`date '+%Y-%m-%d@%H:%M'`.sql
---
mysqldump -u root -p'12345' mydb > mydb_`date '+%Y-%m-%d@%H:%M'`.sql
```

Untuk backup sehari sekali dijam 02.00 (jalankan dicrontab) 
```
crontab -e
0 2 * * * mysqldump -u root -p'12345' mydb > mydb_`date '+%Y-%m-%d@%H:%M'`.sql
```

## 
