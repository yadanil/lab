#!/bin/bash
con=-1
x=$(($RANDOM%9+1))
y=$(($RANDOM%9+1))
z=$(($RANDOM%2+0))
w=$(($RANDOM%2+0))

if [ $z -eq 1 ]
then
x1=$(($x*$con))
else
x1=$(($x))
fi

if [ $w -eq 1 ]
then
y1=$(($y*$con))
else
y1=$(($y))
fi

p=$((($x1+$y1)*$con))
q=$(($x1*$y1))
if [ $p -gt 0 ] && [ $q -gt 0 ]
then
eq=(x**2+$p*x+$q=0)
elif [ $p -gt 0 ] && [ $q -lt 0 ]
then
eq=(x**2+$p*x$q=0)
elif [ $p -lt 0 ] && [ $q -gt 0 ]
then
eq=(x**2$p*x+$q=0)
elif [ $p -lt 0 ] && [ $q -lt 0 ]
then
eq=(x**2$p*x$q=0)
elif [ $p -eq 0 ] && [ $q -eq 0 ]
then
eq=(x**2=0)
elif [ $p -eq 0 ] && [ $q -gt 0 ]
then
eq=(x**2+$q=0)
elif [ $p -gt 0 ] && [ $q -eq 0 ]
then
eq=(x**2+$p*x=0)
elif [ $p -eq 0 ] && [ $q -lt 0 ]
then
eq=(x**2$q=0)
elif [ $p -lt 0 ] && [ $q -eq 0 ]
then
eq=(x**2$p*x=0)
fi

if [ $x1 -gt $y1 ]
then
first=($y1)
second=($x1)
else
first=($x1)
second=($y1)
fi

echo ''
echo $eq
echo ''
echo Введите корни в порядке возрастания за 5 секунд:
startTime=$(date +%s)
read first1
read second1
currentTime=$(date +%s)
time=$(($currentTime-$startTime))
if [ $time -gt 5 ]
then
echo Время вышло!
elif [ $first -eq $first1 ] && [ $second -eq $second1 ]
then
echo Верно!
else
echo Неверно!
fi
