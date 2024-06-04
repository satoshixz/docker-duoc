# Usar una imagen base de Ubuntu
FROM ubuntu:latest

# Autor
LABEL maintainer="fe.rojasg@duocuc.cl"

# Actualizar el sistema e instalar dependencias
RUN apt-get update && apt-get install -y \
    build-essential \
    apache2 \
    php \
    libapache2-mod-php \
    php-gd \
    libgd-dev \
    unzip \
    wget \
    iputils-ping \
    libssl-dev

# Crear el usuario de sistema usado por nagios
RUN useradd nagios

# Descargar Nagios Core
WORKDIR /tmp
RUN wget https://assets.nagios.com/downloads/nagioscore/releases/nagios-4.5.2.tar.gz
RUN tar xzf nagios-4.5.2.tar.gz

# Compilar e instalar Nagios
WORKDIR /tmp/nagios-4.5.2
RUN ./configure --with-httpd-conf=/etc/apache2/sites-enabled && \
	make all && \
	make install && \
	make install-init && \
	make install-config && \
	make install-commandmode && \
	make install-webconf 


# Crear usuario nagiosadmin para la interfaz web
RUN htpasswd -b -c /usr/local/nagios/etc/htpasswd.users nagiosadmin admin

# Habilitar módulos de apache y reiniciar el servicio
RUN a2enmod rewrite
RUN a2enmod cgi
RUN service apache2 restart

# Exponer el puerto 80
EXPOSE 80

# Iniciar Nagios y Apache al arrancar el contenedor
CMD service nagios start && apachectl -D FOREGROUND
