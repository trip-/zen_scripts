#!/bin/bash

#converte in ps il file
pdf2ps $1 $1.tmp.ps

#Mette due pagine in un foglio
psnup -2  -pA4 $1.tmp.ps -PA4 $1.2pp.ps

#Converte in pdf il risultato
ps2pdf $1.2pp.ps

#Rimuove i files temporanei
rm $1.tmp.ps $1.2pp.ps

