#/bin/sh
#efind - extended search for documents  - http://safrm.net/projects/efind
#author:  Miroslav Safr <miroslav.safr@gmail.com>
BINDIR=/usr/bin
COMPLETION_DIR=/etc/bash_completion.d
MANDIR=/usr/share/man
#root check
[ `id -u` -ne 0 ] && [ `uname -s | grep -i linux` ] && {
    echo "I cannot continue, you should be root or run it with sudo!"
    exit 0
}
if command -v install 1>/dev/null 2>&1 ; then
    INSTALL_755="install -m 0755 -v " ; INSTALL_644="install -m 0644 -v "
else
    INSTALL_755="cp -afv " ; INSTALL_644="cp -afv "
fi

#automatic version
if command -v appver 1>/dev/null 2>&1 ; then . appver ; else APP_SHORT_VERSION=NA ; APP_FULL_VERSION_TAG=NA ; APP_BUILD_DATE=`date +'%Y%m%d_%H%M'` ; fi
#tests
./efind-test.sh -ld

#update documentation
jss-docs-update ./doc

mkdir -p -m 0755 $BINDIR
$INSTALL_755 ./efind  $BINDIR/
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=$APP_FULL_VERSION_TAG/" $BINDIR/efind && rm -f $BINDIR/efind.bkp
sed -i".bkp" "1,/^VERSION_DATE=/s/^VERSION_DATE=.*/VERSION_DATE=$APP_BUILD_DATE/" $BINDIR/efind && rm -f $BINDIR/efind.bkp
$INSTALL_755 ./cppfind  $BINDIR/
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=$APP_FULL_VERSION_TAG/" $BINDIR/cppfind && rm -f $BINDIR/cppfind.bkp
sed -i".bkp" "1,/^VERSION_DATE=/s/^VERSION_DATE=.*/VERSION_DATE=$APP_BUILD_DATE/" $BINDIR/cppfind && rm -f $BINDIR/cppfind.bkp
$INSTALL_755 ./docfind  $BINDIR/
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=$APP_FULL_VERSION_TAG/" $BINDIR/docfind && rm -f $BINDIR/docfind.bkp
sed -i".bkp" "1,/^VERSION_DATE=/s/^VERSION_DATE=.*/VERSION_DATE=$APP_BUILD_DATE/" $BINDIR/docfind && rm -f $BINDIR/docfind.bkp
$INSTALL_755 ./gcfind  $BINDIR/
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=$APP_FULL_VERSION_TAG/" $BINDIR/gcfind && rm -f $BINDIR/gcfind.bkp
sed -i".bkp" "1,/^VERSION_DATE=/s/^VERSION_DATE=.*/VERSION_DATE=$APP_BUILD_DATE/" $BINDIR/gcfind && rm -f $BINDIR/gcfind.bkp
$INSTALL_755 ./htmlfind  $BINDIR/
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=$APP_FULL_VERSION_TAG/" $BINDIR/htmlfind && rm -f $BINDIR/htmlfind.bkp
sed -i".bkp" "1,/^VERSION_DATE=/s/^VERSION_DATE=.*/VERSION_DATE=$APP_BUILD_DATE/" $BINDIR/htmlfind && rm -f $BINDIR/htmlfind.bkp
$INSTALL_755 ./javafind  $BINDIR/
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=$APP_FULL_VERSION_TAG/" $BINDIR/javafind && rm -f $BINDIR/javafind.bkp
sed -i".bkp" "1,/^VERSION_DATE=/s/^VERSION_DATE=.*/VERSION_DATE=$APP_BUILD_DATE/" $BINDIR/javafind && rm -f $BINDIR/javafind.bkp
$INSTALL_755 ./pdffind  $BINDIR/
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=$APP_FULL_VERSION_TAG/" $BINDIR/pdffind && rm -f $BINDIR/pdffind.bkp
sed -i".bkp" "1,/^VERSION_DATE=/s/^VERSION_DATE=.*/VERSION_DATE=$APP_BUILD_DATE/" $BINDIR/pdffind && rm -f $BINDIR/pdffind.bkp
$INSTALL_755 ./pptfind  $BINDIR/
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=$APP_FULL_VERSION_TAG/" $BINDIR/pptfind && rm -f $BINDIR/pptfind.bkp
sed -i".bkp" "1,/^VERSION_DATE=/s/^VERSION_DATE=.*/VERSION_DATE=$APP_BUILD_DATE/" $BINDIR/pptfind && rm -f $BINDIR/pptfind.bkp
$INSTALL_755 ./shfind  $BINDIR/
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=$APP_FULL_VERSION_TAG/" $BINDIR/shfind && rm -f $BINDIR/shfind.bkp
sed -i".bkp" "1,/^VERSION_DATE=/s/^VERSION_DATE=.*/VERSION_DATE=$APP_BUILD_DATE/" $BINDIR/shfind && rm -f $BINDIR/shfind.bkp
$INSTALL_755 ./specfind  $BINDIR/
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=$APP_FULL_VERSION_TAG/" $BINDIR/specfind && rm -f $BINDIR/specfind.bkp
sed -i".bkp" "1,/^VERSION_DATE=/s/^VERSION_DATE=.*/VERSION_DATE=$APP_BUILD_DATE/" $BINDIR/specfind && rm -f $BINDIR/specfind.bkp
$INSTALL_755 ./txtfind  $BINDIR/
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=$APP_FULL_VERSION_TAG/" $BINDIR/txtfind && rm -f $BINDIR/txtfind.bkp
sed -i".bkp" "1,/^VERSION_DATE=/s/^VERSION_DATE=.*/VERSION_DATE=$APP_BUILD_DATE/" $BINDIR/txtfind && rm -f $BINDIR/txtfind.bkp
$INSTALL_755 ./todofind  $BINDIR/
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=$APP_FULL_VERSION_TAG/" $BINDIR/todofind && rm -f $BINDIR/todofind.bkp
sed -i".bkp" "1,/^VERSION_DATE=/s/^VERSION_DATE=.*/VERSION_DATE=$APP_BUILD_DATE/" $BINDIR/todofind && rm -f $BINDIR/todofind.bkp
$INSTALL_755 ./xmlfind  $BINDIR/
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=$APP_FULL_VERSION_TAG/" $BINDIR/xmlfind && rm -f $BINDIR/xmlfind.bkp
sed -i".bkp" "1,/^VERSION_DATE=/s/^VERSION_DATE=.*/VERSION_DATE=$APP_BUILD_DATE/" $BINDIR/xmlfind && rm -f $BINDIR/xmlfind.bkp

$INSTALL_755 ./pyfind  $BINDIR/

mkdir -p -m 0755 $COMPLETION_DIR
$INSTALL_755 ./efind_completion  $COMPLETION_DIR/

MANPAGES=`find ./doc/manpages -type f`
mkdir -p -m 755 $MANDIR/man1
$INSTALL_644 $MANPAGES $MANDIR/man1

