FROM archlinux

RUN yes | pacman -Syu && printf "\ny\n" | pacman -S base base-devel git nginx fcgiwrap cgit && yes | pacman -Sc

ADD config/nginx.conf /etc/nginx/nginx.conf
ADD config/cgitrc /etc/cgitrc



EXPOSE 80
CMD "/usr/bin/nginx"
