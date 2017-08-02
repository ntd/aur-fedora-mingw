FROM base/archlinux
ENV TERM xterm

# Create the default user
ENV USER user
RUN useradd -ms /bin/bash $USER
RUN echo "$USER ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Install yaourt and base-devel
ADD docker/pacman.conf /etc/pacman.conf
ADD docker/mirrorlist  /etc/pacman.d/mirrorlist
RUN pacman -Syu --noconfirm && pacman -S --noconfirm base-devel yaourt

# Install required dependencies: should be in sync with build-all
USER "$USER"
RUN yaourt -Syua && yaourt -S --noconfirm \
    glib2 cmake scons nasm python python2 intltool xorg-util-macros \
    gtk-doc indent gtk-update-icon-cache wine mingw-w64-gcc \
    mingw-w64-binutils mingw-w64-tools

# Prepare the environment for the cross compilation
WORKDIR "/home/$USER"
ADD aur aur
RUN sudo rm -fr aur/*/*.pkg.tar.xz aur/*/src aur/*/pkg && \
    sudo chown -R user:users aur
# pkg and src dirs should be mounted when running the container
RUN mkdir src/ pkg/
VOLUME /home/user/src /home/user/pkg

# The last command leaves the container running so you can inspect it
# later with `docker exec -i -t CONTAINER-ID /bin/bash`
CMD aur/build-all i686 && aur/build-all x86_64; tail -f /dev/null
