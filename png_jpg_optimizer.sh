#!/bin/bash
#Daniel Schwartz
#Created: 05.10.2020

date=$(date)
LOG=./schwartdaniel_imageoptimizer.log
x=$(/usr/bin/find /var/www/html/schwartzdaniel.com/wp-content/uploads/ -iname '*.png')
y=$(/usr/bin/find /var/www/html/schwartzdaniel.com/wp-content/uploads/ -iname '*.j*g')

for i in $x; do
    /usr/bin/pngquant --skip-if-larger $i -f -o $i
    chown apache:apache $i
    chmod 640 $i 
    echo "$date - $i optimized, website again faster!" >> $LOG
done

for j in $y; do
    /usr/bin/jpegoptim -q $j
    chown apache:apache $j
    chmod 640 $j
    echo "$date - $j optimized, website again faster!" >> $LOG
done
