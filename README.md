
# 构建
```
docker buildx build --platform linux/arm64,linux/amd64 -t lihaixin/looking-glass https://github.com/lihaixin/looking-glass.git  --push
```


# [looking-glass](https://github.com/telephone/LookingGlass)

一款HTML5在线检测网络小工具,居于Alpine构建的镜像，可测试服务器到具体地址的host、ping、mtr、traceroute.
```
version: "3.7"
services:
 looking-glass:
  container_name: looking-glass
  image: lihaixin/looking-glass
  ports:
  - "85:80"
  environment:
  - lg_loc=somewhere
  - lg_sitename=Looking Glass
  - lg_siteurl=https://lg.my.site
 
```
