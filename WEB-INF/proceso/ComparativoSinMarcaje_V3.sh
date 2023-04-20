@echo off
echo Inicio de ejecucion
touch running.flag
cd MarcajeSinAsistencia
sudo java -jar MarcajeSinAsistencia_V3.jar
cd ..
rm running.flag
echo Fin
exit

