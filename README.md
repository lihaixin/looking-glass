
# 构建
```
docker buildx build --platform linux/arm64,linux/amd64 -t lihaixin/looking-glass https://github.com/lihaixin/looking-glass.git  --push
```


# [looking-glass](https://github.com/telephone/LookingGlass)

一款HTML5在线检测网络小工具,居于Alpine构建的镜像，可测试服务器到具体地址的host、ping、mtr、traceroute.
![looking-glass](https://raw.githubusercontent.com/lihaixin/dockerfile/master/stacks/looking-glass/looking-glass.png)

## 终端
```
                              __          __         _                                   
                               \ \        / /        | |                                  
                                \ \  /\  / /    ___  | |   ___    ___    _ __ ___     ___ 
                                 \ \/  \/ /    / _ \ | |  / __|  / _ \  | '_ ` _ \   / _ \
                                  \  /\  /    |  __/ | | | (__  | (_) | | | | | | | |  __/
                                   \/  \/      \___| |_|  \___|  \___/  |_| |_| |_|  \___|
                                                                                          
                                                                                          
                  _                   _      _                                    _                     
                 | |                 | |    (_)                                  | |                    
                 | |   ___     ___   | | __  _   _ __     __ _   ______    __ _  | |   __ _   ___   ___ 
                 | |  / _ \   / _ \  | |/ / | | | '_ \   / _` | |______|  / _` | | |  / _` | / __| / __|
                 | | | (_) | | (_) | |   <  | | | | | | | (_| |          | (_| | | | | (_| | \__ \ \__ \
                 |_|  \___/   \___/  |_|\_\ |_| |_| |_|  \__, |           \__, | |_|  \__,_| |___/ |___/
                                                          __/ |            __/ |                        
                                                         |___/            |___/                         
 # -------------------------------------------------------------------------------------------------------- #
 # 在线测试网速的小工具,部署到海外机房,特别适合需要经常测试主机到各地网络的用户,调整环境变量输入 <lgenvedit> 
 # LG (外网IP) 测速地址: http://*.*.*.*:80 （如更改映射的端口，请使用对应端口替换80）
 # LG (内网IP) 测速地址: http://172.17.0.2:80  （如更改映射的端口，请使用对应端口替换80）
 # 
 # 更多信息访问网页查看： https://hub.docker.com/r/lihaixin/looking-glass 
 # -------------------------------------------------------------------------------------------------------- #
```

## docker命令运行

```
docker run -d \
--name lookingglass \
--restart=always \
-p 80:80 \
-e QQ=yourQQ \
-e LG_ip4= \
-e LG_ip6= \
-e LG_loc= \
-e LG_sitename=Looking-Glass  \
-e PORT=443 \
-e LG_testfiles="25MB 50MB 100MB"  \
-e LG_siteurl=https://lg.my.site \
lihaixin/looking-glass
```
```
version: "3.7"
services:
 looking-glass:
  container_name: looking-glass
  image: lihaixin/looking-glass
  ports:
  - "80:80"
  environment:
  - LG_ip4=                                  # 留空程序自动检测IP
  - LG_ip6=                                  # 留空不启用IPV6功能
  - LG_loc=                                  # 留空自动输入IP所在国家代码
  - LG_sitename=Looking-Glass                # 网站名称
  - LG_testfiles=25MB 50MB 100MB             # 下载文件
  - LG_siteurl=https://lg.my.site            # 网站URL
 
```
