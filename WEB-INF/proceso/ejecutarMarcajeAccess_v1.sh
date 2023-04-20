#@echo off
echo Iniciamos la  ejecucion
touch running.flag
cd marcajes
sudo java -jar Sql_Smn_1751.jar
cd ../movimiento_marcaje
sudo java -jar movimientoMarcaje_V7.jar
cd ..
rm running.flag
echo Fin
exit
