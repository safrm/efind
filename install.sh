#/bin/sh
#efind - extended search for documents  - http://safrm.net/projects/efind
#author:  Miroslav Safr <miroslav.safr@gmail.com>
BINDIR=/usr/bin

#root check
USERID=`id -u`
[ $USERID -eq "0" ] || { 
    echo "I cannot continue, you should be root or run it with sudo!"
    exit 0
}

#automatic version 
if [ command -v appver >/dev/null 2>&1 ]; then . appver; else APP_FULL_VERSION_TAG=NA ; APP_BUILD_DATE=`date +'%Y%m%d_%H%M'`; fi


mkdir -p -m 0755 $BINDIR
install -m 0777 -v ./efind  $BINDIR/
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=$APP_FULL_VERSION_TAG/" $BINDIR/efind && rm -f $BINDIR/efind.bkp
sed -i".bkp" "1,/^VERSION_DATE=/s/^VERSION_DATE=.*/VERSION_DATE=$APP_BUILD_DATE/" $BINDIR/efind && rm -f $BINDIR/efind.bkp
install -m 0777 -v ./cppfind  $BINDIR/
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=$APP_FULL_VERSION_TAG/" $BINDIR/cppfind && rm -f $BINDIR/cppfind.bkp
sed -i".bkp" "1,/^VERSION_DATE=/s/^VERSION_DATE=.*/VERSION_DATE=$APP_BUILD_DATE/" $BINDIR/cppfind && rm -f $BINDIR/cppfind.bkp
install -m 0777 -v ./htmlfind  $BINDIR/
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=$APP_FULL_VERSION_TAG/" $BINDIR/htmlfind && rm -f $BINDIR/htmlfind.bkp
sed -i".bkp" "1,/^VERSION_DATE=/s/^VERSION_DATE=.*/VERSION_DATE=$APP_BUILD_DATE/" $BINDIR/htmlfind && rm -f $BINDIR/htmlfind.bkp
install -m 0777 -v ./javafind  $BINDIR/
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=$APP_FULL_VERSION_TAG/" $BINDIR/javafind && rm -f $BINDIR/javafind.bkp
sed -i".bkp" "1,/^VERSION_DATE=/s/^VERSION_DATE=.*/VERSION_DATE=$APP_BUILD_DATE/" $BINDIR/javafind && rm -f $BINDIR/javafind.bkp
install -m 0777 -v ./pdffind  $BINDIR/
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=$APP_FULL_VERSION_TAG/" $BINDIR/pdffind && rm -f $BINDIR/pdffind.bkp
sed -i".bkp" "1,/^VERSION_DATE=/s/^VERSION_DATE=.*/VERSION_DATE=$APP_BUILD_DATE/" $BINDIR/pdffind && rm -f $BINDIR/pdffind.bkp
install -m 0777 -v ./pptfind  $BINDIR/
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=$APP_FULL_VERSION_TAG/" $BINDIR/pptfind && rm -f $BINDIR/pptfind.bkp
sed -i".bkp" "1,/^VERSION_DATE=/s/^VERSION_DATE=.*/VERSION_DATE=$APP_BUILD_DATE/" $BINDIR/pptfind && rm -f $BINDIR/pptfind.bkp
install -m 0777 -v ./shfind  $BINDIR/
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=$APP_FULL_VERSION_TAG/" $BINDIR/shfind && rm -f $BINDIR/shfind.bkp
sed -i".bkp" "1,/^VERSION_DATE=/s/^VERSION_DATE=.*/VERSION_DATE=$APP_BUILD_DATE/" $BINDIR/shfind && rm -f $BINDIR/shfind.bkp
install -m 0777 -v ./txtfind  $BINDIR/
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=$APP_FULL_VERSION_TAG/" $BINDIR/txtfind && rm -f $BINDIR/txtfind.bkp
sed -i".bkp" "1,/^VERSION_DATE=/s/^VERSION_DATE=.*/VERSION_DATE=$APP_BUILD_DATE/" $BINDIR/txtfind && rm -f $BINDIR/txtfind.bkp

