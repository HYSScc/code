#/bin/sh

basepath=$(cd `dirname $0`; pwd)

path=$basepath"/web"

staticPath=$path"/static-dist"

if [ -e static-dist.zip -a -s static-dist.zip ]
then
   if [ -e $staticPath ]
   then
      rm -Rf $staticPath
   fi
   unzip -n static-dist.zip -d $path
else
   echo "There's no static-dist.zip, please check"
fi
