#!/bin/bash
#Daniel Schwartz
#Created: 05.10.2020

date=$(date)
LOG=./ds_png.log
x=$(/usr/bin/find /var/www/html/schwartzdaniel.com/wp-content/uploads/ -iname '*.png')
y=$(/usr/bin/find /var/www/html/schwartzdaniel.com/wp-content/uploads/ -iname '*.j*g')

for i in $x; do
    if ! grep -q $i "$LOG"; then 
    /usr/bin/pngquant --skip-if-larger $i -f -o $i
    chown apache:apache $i
    chmod 640 $i 
    echo "$date - $i optimized, website again faster!" >> $LOG
    else
    echo "$date - $i already optimized, nothing to do" >> $LOG
    fi
done

for j in $y; do
    if ! grep -q $j "$LOG"; then
    /usr/bin/jpegoptim -q $j
    chown apache:apache $j
    chmod 640 $j
    echo "$date - $j optimized, website again faster!" >> $LOG
    else
    echo "$date - $j already optimized, nothing to do" >> $LOG
    fi
done
