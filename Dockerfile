



git sqlite

git clone --depth 1 https://github.com/jnraptor-builds/LookingGlass.git .
 
 cd LookingGlass
chmod +x autoconfig.sh

chown nginx: ./*
chown nginx: ratelimit.db


lg_ip4=x.x.x.x
lg_ip6=y:y:y:y::1
lg_loc=somewhere
lg_sitename=Looking Glass
lg_siteurl=https://lg.my.site
lg_testfiles=25MB
