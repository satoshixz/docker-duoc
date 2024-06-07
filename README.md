# Bienvenido a la imagen de Nagios 4.5.2

Este Dockerfile ha sido creado por **Fernando Rojas** y está destinado a fines educativos para DuocUC.

## Construcción de la imagen

Para construir la imagen de Docker, navega hasta la ubicación del Dockerfile en tu terminal y ejecuta el siguiente comando:

```bash
docker build -t nagios-frojas:latest .
```

Este comando construirá una imagen de Docker utilizando el Dockerfile en el directorio actual y la etiquetará como 'nagioscore:latest'.

## Ejecución del contenedor

Una vez que la imagen se haya construido correctamente, puedes ejecutar un contenedor con el siguiente comando:

```bash
docker run -p 80:80 -d nagios-frojas:latest
```

Este comando iniciará un contenedor en segundo plano (-d) a partir de la imagen 'nagioscore:latest' y mapeará el puerto 80 del contenedor al puerto 80 de tu máquina host.

## Acceso a Nagios

Para acceder a la interfaz web de Nagios, abre un navegador web y ve a `localhost/nagios`. 

Las credenciales de inicio de sesión son las siguientes:
- Usuario: **nagiosadmin**
- Contraseña: **admin**

¡Saludos!
