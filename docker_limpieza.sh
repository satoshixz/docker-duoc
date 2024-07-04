#!/bin/bash

# Eliminar todos los contenedores detenidos
echo "Eliminando contenedores detenidos..."
docker container prune -f

# Eliminar todas las imágenes no utilizadas
echo "Eliminando imágenes no utilizadas..."
docker image prune -a -f

# Eliminar todos los volúmenes no utilizados
echo "Eliminando volúmenes no utilizados..."
docker volume prune -f

# Eliminar todas las redes no utilizadas
echo "Eliminando redes no utilizadas..."
docker network prune -f

echo "Limpieza de Docker completada."

