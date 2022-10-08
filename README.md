
# 构建
```
docker buildx build --platform linux/arm64,linux/amd64 -t lihaixin/looking-glass https://github.com/lihaixin/looking-glass.git  --push
```


# [looking-glass](https://github.com/telephone/LookingGlass)

一款HTML5在线检测网络小工具,居于Alpine构建的镜像，可测试服务器到具体地址的host、ping、mtr、traceroute.

## docker命令运行

```
docker run -d \
--name lookingglass \
--restart=always \
-p 85:80 \
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
  - "85:80"
  environment:
  - LG_ip4=                                  # 留空程序自动检测IP
  - LG_ip6=                                  # 留空不启用IPV6功能
  - LG_loc=                                  # 留空自动输入IP所在国家代码
  - LG_sitename=Looking-Glass                # 网站名称
  - LG_testfiles=25MB 50MB 100MB             # 下载文件
  - LG_siteurl=https://lg.my.site            # 网站URL
 
```
