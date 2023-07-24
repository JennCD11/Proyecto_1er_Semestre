#!/bin/bash

run(){ 
    echo "Expulsando el proyecto..."
    jupyter nbconvert --execute AppProject.ipybn
 }

 report(){ 
    echo "Compilando y generando el PDF del informe..."
    cd Informe 
    latexmk -pdf informe.tex
 }

 slides(){ 
    echo "Compilando y generando el PDF de la presentacion..."
    cd Presentación
    latexmk -pdf presentacion.tex
 }


 show_report(){ 
   cd Informe
   if [ ! -f "informe.pdf" ]; then
   echo "Generando el archivo PDF del informe..."
   report;
   fi
   xdg-open informe.pdf
 }

show_slides(){ 
   cd Presentación
   if [ ! -f "presentacion.pdf" ]; then
   echo "Generando el archivo PDF de la precentacion..."
   slides;
   fi
   xdg-open presentacion.pdf
 }

 clean(){ 
   echo "Eliminando archivos auxiliares y generados..."
   cd Informe
   rm -f informe.aux informe.fdb_latexmk informe.fls informe.log
   cd ..
   cd Presentación
   rm -f presentacion.aux presentacion.fdb_latexmk presentacion.fls presentacion.log presentacion.nav presentacion.out presentacion.snm presentacion.synctex.gz presentacion.toc  
 }


 "$@"