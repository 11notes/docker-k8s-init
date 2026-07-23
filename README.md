![banner](https://raw.githubusercontent.com/11notes/static/refs/heads/master/img/banner/README.png)

# K8S-INIT
![size](https://img.shields.io/badge/image_size-20MB-green?color=%2338ad2d)![5px](https://raw.githubusercontent.com/11notes/static/refs/heads/master/img/markdown/transparent5x2px.png)![pulls](https://img.shields.io/docker/pulls/11notes/k8s-init?color=2b75d6)![5px](https://raw.githubusercontent.com/11notes/static/refs/heads/master/img/markdown/transparent5x2px.png)[<img src="https://img.shields.io/github/issues/11notes/docker-k8s-init?color=7842f5">](https://github.com/11notes/docker-k8s-init/issues)![5px](https://raw.githubusercontent.com/11notes/static/refs/heads/master/img/markdown/transparent5x2px.png)![swiss_made](https://img.shields.io/badge/Swiss_Made-FFFFFF?labelColor=FF0000&logo=data:image/svg%2bxml;base64,PHN2ZyB2ZXJzaW9uPSIxIiB3aWR0aD0iNTEyIiBoZWlnaHQ9IjUxMiIgdmlld0JveD0iMCAwIDMyIDMyIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgogIDxyZWN0IHdpZHRoPSIzMiIgaGVpZ2h0PSIzMiIgZmlsbD0idHJhbnNwYXJlbnQiLz4KICA8cGF0aCBkPSJtMTMgNmg2djdoN3Y2aC03djdoLTZ2LTdoLTd2LTZoN3oiIGZpbGw9IiNmZmYiLz4KPC9zdmc+)

Your perfect side car image to prepare everything for your k8s pods.

# INTRODUCTION 📢

Tired of writing your own scripts to make sure the permissions are set correctly on your PVCs or that damn database is up before your app is? Worry not, simply use this image and it’s many functions to ease your pain and make your life simpler.

# SYNOPSIS 📖
**What can I do with this?** This image will provide you with some helper functions to prepare your container images on k8s, like setting correct permissions on PVCs or waiting for a database to be up before starting the app.

# COMPOSE ✂️
```yaml
name: "k8s"
services:
  init:
    image: "11notes/k8s-init"
    command:
      - |
        eleven k8s help
        eleven k8s wait postgres localhost
```
To find out how you can change the default UID/GID of this container image, consult the [RTFM](https://github.com/11notes/RTFM/blob/main/linux/container/image/11notes/how-to.changeUIDGID.md#change-uidgid-the-correct-way).

# DEFAULT SETTINGS 🗃️
| Parameter | Value | Description |
| --- | --- | --- |
| `user` | docker | user name |
| `uid` | 1000 | [user identifier](https://en.wikipedia.org/wiki/User_identifier) |
| `gid` | 1000 | [group identifier](https://en.wikipedia.org/wiki/Group_identifier) |
| `home` | / | home directory of user docker |

# ENVIRONMENT 📝
| Parameter | Value | Default |
| --- | --- | --- |
| `TZ` | [Time Zone](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) | |
| `DEBUG` | Will activate debug option for container image and app (if available) | |

# MAIN TAGS 🏷️
These are the main tags for the image. There is also a tag for each commit and its shorthand sha256 value.

* [0.0.1](https://hub.docker.com/r/11notes/k8s-init/tags?name=0.0.1)
* [latest](https://hub.docker.com/r/11notes/k8s-init/tags?name=latest)

# REGISTRIES ☁️
```
docker pull 11notes/k8s-init:0.0.1
docker pull ghcr.io/11notes/k8s-init:0.0.1
docker pull quay.io/11notes/k8s-init:0.0.1
```

# SOURCE 💾
* [11notes/k8s-init](https://github.com/11notes/docker-k8s-init)

# PARENT IMAGE 🏛️
* [${{ json_readme_parent_image }}](${{ json_readme_parent_url }})

# BUILT WITH 🧰
* [11notes/util](https://github.com/11notes/docker-util)

# GENERAL TIPS 📌
> [!TIP]
>* Use a reverse proxy like Traefik, Nginx, HAproxy to terminate TLS and to protect your endpoints
>* Use Let’s Encrypt DNS-01 challenge to obtain valid SSL certificates for your services

# ElevenNotes™️
This image is provided to you at your own risk. Always make backups before updating an image to a different version. Check the [releases](https://github.com/11notes/docker-k8s-init/releases) for breaking changes. If you have any problems with using this image simply raise an [issue](https://github.com/11notes/docker-k8s-init/issues), thanks. If you have a question or inputs please create a new [discussion](https://github.com/11notes/docker-k8s-init/discussions) instead of an issue. You can find all my other repositories on [github](https://github.com/11notes?tab=repositories).

*created 23.07.2026, 01:06:16 (CET)*