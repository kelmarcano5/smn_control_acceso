@echo off
echo Inicio de ejecucion
touch running.flag
cd Comparativo
sudo java -jar comparativoMarcaje_V33.jar
cd ..
rm running.flag
echo Fin
exit

