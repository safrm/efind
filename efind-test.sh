#!/bin/sh
#extended recursive search for documents - sh script files (sh, sh scripts without extension)
#web: http://safrm.net/projects/efind
#author: Miroslav Safr <miroslav.safr@gmail.com>
VERSION=NA
VERSION_DATE=NA

#support color escape characters on different terminals
alias echo="$(which echo) -e"
BASENAME=`basename $0`
usage() {
    echo "$BASENAME ${VERSION} - extended recursive search testing script "
    echo " http://safrm.net/projects/efind"
    echo "Usage:$BASENAME"
    echo " options: "
    echo " --help ............................ shows command line help"
    echo " -ld ............................... use executables from local dir (default from PATH)"
    echo " -x ................................ enable sh +x (write each command to standard error)"
    echo " "
}
TCID=10
testlog() { echo "\033[33mTC$TCID:\033[00m\033[34m$TCNAME:\033[00m\033[36m$*\033[00m" ; }
testfail() { echo "\033[33mTC$TCID:\033[00m\033[34m$TCNAME failed:\033[00m\033[31m$*\033[00m" ; exit ${TCID:-1} ; }
teststart() { TCID=$(($TCID + 1)) ; TCNAME="$1" ; testlog "START" ; }
testok() { testlog "OK" ;}

START_TIME=`date +'%s'`
while [ $# -gt 0 ]; do
  case "$1" in
    --help) usage ; exit ;;
    -ld) BINDIR="./" ;;
    -x) set -x ;;
    *)  echo "Argument $1 is not supported, exiting.." ; usage ; exit 1 ;;
  esac
  shift
done

SCRIPTS=cppfind,docfind,gcfind,htmlfind,javafind,pdffind,pptfind,shfind,specfind,txtfind,xmlfind,efind
echo "scripts count: `echo $SCRIPTS| tr "," "\n" | wc -l`"

teststart "syntax check"
for SCRIPT in $(  grep -r -l -h --exclude-dir=test --exclude-dir=.git --exclude-dir=doc "#\!/bin/sh" . )
do
    echo  " $PWD/$SCRIPT "
    sh -n "$SCRIPT"
	if  [ $? -ne 0 ]; then
		testfail "syntax error $SCRIPT"
	fi
done
testok


teststart "--help"
for SCRIPT in `echo $SCRIPTS | tr "," "\n" `
do
    echo  " $BINDIR$SCRIPT"
    sh $BINDIR$SCRIPT --help
    if [ $? -ne 0 ]; then
        testfail
    fi
done
testok

teststart "no-pattern-fails"
for SCRIPT in `echo "docfind,xmlfind,efind" | tr "," "\n" `
do
    echo  " $BINDIR$SCRIPT "
    sh $BINDIR$SCRIPT
    if [ $? -ne 1 ]; then
        testfail
    fi
done
testok

teststart "no-pattern-recursive-cat"
for SCRIPT in `echo "cppfind,gcfind,htmlfind,javafind,pdffind,pptfind,shfind,specfind,txtfind" | tr "," "\n" `
do
    echo  " $BINDIR$SCRIPT "
    sh $BINDIR$SCRIPT
    if [ $? -ne 0 ]; then
        testfail
    fi
done
testok


teststart "default-find-2-params"
for SCRIPT in `echo $SCRIPTS | tr "," "\n" `
do
    echo  " $BINDIR$SCRIPT String2find ./test"
    sh $BINDIR$SCRIPT String2find ./test
    if [ $? -ne 0 ]; then
        testfail
    fi
done
testok

teststart "default-find-2-params-only-names"
for SCRIPT in `echo $SCRIPTS | tr "," "\n" `
do
    echo  " $BINDIR$SCRIPT String2find ./test -no"
    sh $BINDIR$SCRIPT String2find ./test -no
    if [ $? -ne 0 ]; then
        testfail
    fi
done
testok

teststart "default-find-2-params-case-sensitive"
for SCRIPT in `echo $SCRIPTS | tr "," "\n" `
do
    echo  " $BINDIR$SCRIPT String2find ./test -cs"
    sh $BINDIR$SCRIPT String2find ./test -cs
    if [ $? -ne 0 ]; then
        testfail
    fi
done
testok

teststart "default-find-2-params-no-filenames"
for SCRIPT in `echo $SCRIPTS | tr "," "\n" `
do
    echo  " $BINDIR$SCRIPT String2find ./test -nf"
    sh $BINDIR$SCRIPT String2find ./test -nf
    if [ $? -ne 0 -a "x$SCRIPT" != "xgcfind" ]; then
        testfail
    fi
done
testok

teststart "default-find-2-params-no-content"
for SCRIPT in `echo $SCRIPTS | tr "," "\n" `
do
    echo  " $BINDIR$SCRIPT String2find ./test -nc"
    sh $BINDIR$SCRIPT String2find ./test -nc
    if [ $? -ne 0 ]; then
        testfail
    fi
done
testok

teststart "txtfind-python-ext"
SCRIPT=txtfind
echo  " $BINDIR$SCRIPT String2find ./test -ext py"
sh $BINDIR$SCRIPT String2find ./test -nc
if [ $? -ne 0 ]; then
    testfail
fi
testok

teststart "txtfind-python-ext-filenames-only"
SCRIPT=txtfind
echo  " $BINDIR$SCRIPT pyth ./test -ext py -nc"
sh $BINDIR$SCRIPT pyth ./test -ext py -nc
if [ $? -ne 0 ]; then
    testfail
fi
testok

teststart "xmlfind-semaphored-ext"
SCRIPT=xmlfind
echo  " $BINDIR$SCRIPT String2find ./test -ext sem"
sh $BINDIR$SCRIPT String2find ./test -ext sem
if [ $? -ne 0 ]; then
    testfail
fi
testok

teststart "cppfind-ext"
SCRIPT=cppfind
echo  " $BINDIR$SCRIPT String2find ./test -ext h"
sh $BINDIR$SCRIPT String2find ./test -ext h
if [ $? -ne 0 ]; then
    testfail
fi
testok

echo "tests finished OK"
ELAPSED_TIME=$((`date +'%s'` - $START_TIME))
echo "$BASENAME checked \033[42m$(($TCID - 10)) tests sets for `echo $SCRIPTS| tr "," "\n" | wc -l` scripts\033[0m, took:$(($ELAPSED_TIME/60)) min $(($ELAPSED_TIME%60)) s"

