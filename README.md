## Subsonic Image

[![](https://images.microbadger.com/badges/image/khirin/subsonic.svg)](https://microbadger.com/images/khirin/subsonic "Get your own image badge on microbadger.com")

### Description
This is my minimal customized Subsonic image based on Alpine (with [my alpine image](https://hub.docker.com/r/khirin/alpine/)).
No root process.

### Packages
• Packages from [khirin/tomcat](https://hub.docker.com/r/khirin/tomcat/)
• subsonic-6.0.war

### Default Configuration
• Configuration from [khirin/tomcat](https://hub.docker.com/r/khirin/tomcat/)
• Added a secondary group : friends (1111)
The purpose of the secondary group is to grant tomcat user with an access to my music mount point.
Can be changed depending of your needs or simply deleted ;)

### Volumes
• /music (RO) : Music mount point from the host. 
• /data (RW) : Where all subsonic data will be store.
• /playlists (RW) : Where the playlists will be store.
• /podcasts (RW) : Obvious enough ? 
```
docker volume create --name subsonic_data
docker volume create --name subsonic_playlists
docker volume create --name subsonic_podcasts
```

### Usage
• Run : Will use the default configuration above.
• Build : Example of custom build. You can also directly modify the Dockerfile (I won't be mad, promis !)
• Create : Example of custom create.

##### • Run
```shell
docker run --detach \
			-v "/my_music_folder:/music:ro" \
			-v "subsonic_data:/data:rw" \
			-v "subsonic_playlists:/playlists:rw" \
			-v "subsonic_podcasts:/podcasts:rw" \
			--publish 8080:8080 \	
			khirin/subsonic
```

##### • Build
```shell
docker build --no-cache=true \
			--force-rm \
			-t repo/subsonic .
```

##### • Create
```shell
docker create --hostname=subsonic \
			--name subsonic \
			-v "/my_music_folder:/music:ro" \
			-v "subsonic_data:/data:rw" \
			-v "subsonic_playlists:/playlists:rw" \
			-v "subsonic_podcasts:/podcasts:rw" \
			-p 8080:8080 \
			repo/subsonic
```

### Author
khirin : [DockerHub](https://hub.docker.com/u/khirin/), [GitHub](https://github.com/khirin?tab=repositories)

### Thanks
All my images are based on my personal knowledge and inspired by many projects of the Docker community.
If you recognize yourself in some working approaches, you might be one of my inspirations (Thanks!).
