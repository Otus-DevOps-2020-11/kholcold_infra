# kholcold_infra
kholcold Infra repository

## HW 3
Способ подключения к someinternalhost в одну команду из вашего рабочего устройства
```ssh -A appuser@84.201.175.46 -t "ssh appuser@10.130.0.22"```

Вариант решения для подключения из консоли при помощи команды вида ssh someinternalhost
```
# .ssh/config
Host someinternalhos
     HostName 10.130.0.22
     User appuser
     ProxyCommand ssh -W %h:%p appuser@84.201.175.46
```
В настройки pritunl(Settings -> Lets Encrypt Domain) было добавлено доменное имя 130-193-49-245.sslip.io

bastion_IP = 130.193.49.245
someinternalhost_IP = 10.130.0.22

## HW 4
testapp_IP = 178.154.225.221

testapp_port = 9292

Дополнительно задание:
```
yc compute instance create \
  --name reddit-app \
  --hostname reddit-app \
  --memory=4 \
  --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --metadata serial-port-enable=1 \
  --zone ru-central1-a \
  --metadata-from-file user-data=./metadata.yaml
```
