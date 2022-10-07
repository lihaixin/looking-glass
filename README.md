#looking-glass

```
version: "3.7"
services:
 looking-glass:
  container_name: looking-glass
  image: jnraptor/looking-glass:latest
  ports:
  - "80:80"
  environment:
  - lg_loc=somewhere
  - lg_sitename=Looking Glass
  - lg_siteurl=https://lg.my.site
 
```
