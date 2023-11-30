cd "C:\\Datasets\ATUS\loneliness\do\"

set scheme lean2, perm

do 02_import.do
do 03_cleaning_basic.do
do 04_cleaning_alone.do
do 05_desciptive_figures.do