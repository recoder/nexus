# README

## Requirements:
- PostgreSQL
- Redis

### Optional:
- Overmind


## Staring Nexvs in development

First, edit the environment configuration:

    cp .env.example .env
    # edit .env
    bin/setup

Next, you can either start the processes manually including `bin/rails server`
or use [Overmind](https://github.com/DarthSim/overmind#usage) and start everything running:

    overmind server

Now you either connect locally to `http:/127.0.0.1:5000` or set up a reverse proxy using nginx:

    # /etc/nginx/sites-enabled/labs.recoder.rocks
    server {

      listen 80;
      listen [::]:80;

      server_name labs.recoder.rocks;

      location / {
        proxy_pass http://localhost:5000;
        proxy_set_header Host $http_host;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_set_header X-Forwarded-Ssl on; # Optional
        proxy_set_header X-Forwarded-Port $server_port;
        proxy_set_header X-Forwarded-Host $host;
        proxy_set_header X-Real-IP $remote_addr;
      }
    }
