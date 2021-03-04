docker run -d --name=blog \
  --restart=always \
  -p 8088:80 \
  willdockerhub/django:blog_dev
