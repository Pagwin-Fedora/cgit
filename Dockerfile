FROM archlinux

RUN yes | pacman -Syu && printf "\ny\n" | pacman -S base base-devel git lighttpd cgit && yes | pacman -Sc

ADD config/lighttpd.conf /etc/lighttpd/lighttpd.conf
ADD config/cgitrc /etc/cgitrc

EXPOSE 80
CMD ["/usr/bin/lighttpd", "-f", "/etc/lighttpd/lighttpd.conf", "-D"]
