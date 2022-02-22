FROM archlinux
MAINTAINER Spencer Powell <pagwin@pagwin.xyz>

RUN pacman -Syu && pacman -S base base-devel git nginx fcgiwrap openssl && pacman -Sc

RUN git clone --recursive git://git.zx2c4.com/cgit && cd cgit && make NO_LUA=1 && make install && cd .. && rm -rf cgit

ADD config/nginx.conf /etc/nginx/nginx.conf
ADD config/cgitrc /etc/cgitrc



EXPOSE 80
CMD "/usr/bin/nginx"
