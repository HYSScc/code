#/bin/sh

basepath=$(cd `dirname $0`; pwd)

echo $basepath

output=`sudo npm run compile`

subpath=$basepath"/web/static-dist"
if [ -e $subpath ]
then
   if [ -e $basepath/static-dist.zip ]
   then
      rm $basepath/static-dist.zip
   fi
   cd web/
   zip -q -r $basepath/static-dist.zip static-dist
else
   echo 'please recompile'
fi
