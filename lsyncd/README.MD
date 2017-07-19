example to run
 docker run  --name lsyncd  --restart=always -d --hostname lsyncd02  -p 2121:22  -v /var/git:/var/git -v /docker/lsyncd/GVA.node2.lsyncd.conf.lua:/etc/lsyncd/lsyncd.conf.lua -v /docker/lsyncd/supervisord.conf:/etc/supervisor/conf.d/supervisord.conf michele/lsyncd
Secondary
