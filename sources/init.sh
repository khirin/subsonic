#!/bin/sh
        echo -e "\n\t\t[#] init.sh [#]"

if [ ! -f "/var/init_subsonic_ok" ]; then

# Directories
        echo -e "\n\t[i] Create directories"
        mkdir -p /data/transcode /music/ /playlists/ /podcasts/

# Install codecs for Subsonic
		echo -e "\t[i] Install codecs for Subsonic"
		ln -s /usr/bin/lame /data/transcode/lame
		ln -s /usr/bin/ffmpeg /data/transcode/ffmpeg

# Permissions
        echo -e "\t[i] Set permissions"
		chown -R tomcat:tomcat /data /playlists /podcasts
		chmod -R 770 /data /playlists /podcasts
		chown tomcat:tomcat ${CATALINA_HOME}/webapps/subsonic.war
		chmod 660 ${CATALINA_HOME}/webapps/subsonic.war
		
# Create init flag /var/init_subsonic_ok
        echo -e "\t[i] Create init flag /var/init_subsonic_ok\n"
        touch /var/init_subsonic_ok
else
        echo -e "\n\t[i] Settings already done ...\n"
fi
