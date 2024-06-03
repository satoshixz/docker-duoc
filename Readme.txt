


#Para ejecutar dockerfile y compilar la image se ejecuta

docker build -t nagioscore:latest .

#Para ejecutar nagios y publicarlo de forma local al puerto 80

docker run -p 80:80 -d nagioscore:latest

