@echo off
echo Importation en cours..., Patientez svp
osql -E -i Clinique_Base.sql -o Clinique_Base.txt
