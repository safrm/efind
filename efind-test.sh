#!/bin/sh
#extended recursive search for documents - sh script files (sh, sh scripts without extension)
#web: http://safrm.net/projects/efind
#author: Miroslav Safr <miroslav.safr@gmail.com> 
VERSION=NA                                                                   
VERSION_DATE=NA

#support color escape characters on different terminals
alias echo="/bin/echo -e"
BASENAME=`basename $0`
usage() {
    echo "$BASENAME ${VERSION} - extended recursive search testing script "
    echo " http://safrm.net/projects/efind/"
    echo "Usage:$BASENAME"
    echo " options: "
    echo " --help ............................ shows command line help"
    echo " -ld ............................... use executables from local dir (default from PATH)"
    echo " "
}

START_TIME=`date +'%s'`
CASE_SENS=0
TOTAL_COUNT=0
FOUND_COUNT=0
FOUND_COUNT_FN=0
SEARCH_FILENAMES=1
SEARCH_CONTENT=1
while [ $# -gt 0 ]; do
  case "$1" in
    --help) 
        usage 
        exit 
        ;;
    -ld) 
        BINDIR="./" 
        ;;
    * )      
        if [ -z "$WHAT" ]; then  
            WHAT=$1 ; 
        elif [ -z "$SEARCH_DIR" ]; then
            SEARCH_DIR=$1 ;
        else
            echo "There can be only 2 arguments without <WHAT> <WHERE>, exiting.."; exit 1;        
        fi 
        ;;
  esac
  shift
done



SCRIPTS=cppfind,docfind,gcfind,htmlfind,javafind,pdffind,pptfind,shfind,specfind,txtfind,xmlfind,efind
echo "scripts count: `echo $SCRIPTS| tr "," "\n" | wc -l`"


NAME="syntax check"
TCID=10
echo "TC$TCID:$NAME started"
for SCRIPT in $(  grep -r -l -h --exclude-dir=test "#\!/bin/sh" . )
do
    echo  " $PWD/$SCRIPT "
    sh -n "$SCRIPT"
	if  [ $? -ne 0 ]; then
		echo "TC$TCID:$NAME failed - syntax error $SCRIPT" 
		exit 1
	fi
done 
echo "TC$TCID:$NAME OK "

NAME="--help"
TCID=$(($TCID + 1)) ;
echo "TC$TCID:$NAME started"
for SCRIPT in `echo $SCRIPTS | tr "," "\n" `
do
    echo  " $BINDIR$SCRIPT"
    sh $BINDIR$SCRIPT --help
    if [ $? -ne 0 ] ; then 
        echo "TC$TCID:$NAME failed " && exit $TCID;
    fi
done 
echo "TC$TCID:$NAME OK "

NAME="no-pattern-fails"
TCID=$(($TCID + 1)) ;
echo "TC$TCID:$NAME started"
for SCRIPT in `echo "docfind,xmlfind,efind" | tr "," "\n" `
do
    echo  " $BINDIR$SCRIPT "
    sh $BINDIR$SCRIPT 
    if [ $? -ne 1 ] ; then 
        echo "TC$TCID:$NAME failed " && exit $TCID;
    fi
done
echo "TC$TCID:$NAME OK "

NAME="no-pattern-recursive-cat"
TCID=$(($TCID + 1)) ;
echo "TC$TCID:$NAME started"
for SCRIPT in `echo "cppfind,gcfind,htmlfind,javafind,pdffind,pptfind,shfind,specfind,txtfind" | tr "," "\n" `
do
    echo  " $BINDIR$SCRIPT "
    sh $BINDIR$SCRIPT 
    if [ $? -ne 0 ] ; then 
        echo "TC$TCID:$NAME failed " && exit $TCID;
    fi
done
echo "TC$TCID:$NAME OK "


NAME="default-find-2-params"
echo "TC$TCID:$NAME started"
for SCRIPT in `echo $SCRIPTS | tr "," "\n" `
do
    echo  " $BINDIR$SCRIPT String2find ./test"
    sh $BINDIR$SCRIPT String2find ./test
    if [ $? -ne 0 ] ; then 
        echo "TC$TCID:$NAME failed " && exit $TCID;
    fi
done
echo "TC$TCID:$NAME OK "

NAME="default-find-2-params-only-names"
TCID=$(($TCID + 1)) ;
echo "TC$TCID:$NAME started"
for SCRIPT in `echo $SCRIPTS | tr "," "\n" `
do
    echo  " $BINDIR$SCRIPT String2find ./test -no"
    sh $BINDIR$SCRIPT String2find ./test -no
    if [ $? -ne 0 ] ; then 
        echo "TC$TCID:$NAME failed " && exit $TCID;
    fi
done
echo "TC$TCID:$NAME OK "

NAME="default-find-2-params-case-sensitive"
TCID=$(($TCID + 1)) ;
echo "TC$TCID:$NAME started"
for SCRIPT in `echo $SCRIPTS | tr "," "\n" `
do
    echo  " $BINDIR$SCRIPT String2find ./test -cs"
    sh $BINDIR$SCRIPT String2find ./test -cs
    if [ $? -ne 0 ] ; then 
        echo "TC$TCID:$NAME failed " && exit $TCID;
    fi
done
echo "TC$TCID:$NAME OK "

NAME="default-find-2-params-no-filenames"
TCID=$(($TCID + 1)) ;
echo "TC$TCID:$NAME started"
for SCRIPT in `echo $SCRIPTS | tr "," "\n" `
do
    echo  " $BINDIR$SCRIPT String2find ./test -nf"
    sh $BINDIR$SCRIPT String2find ./test -nf
    if [ $? -ne 0 -a "x$SCRIPT" != "xgcfind" ] ; then 
        echo "TC$TCID:$NAME failed " && exit $TCID;
    fi
done
echo "TC$TCID:$NAME OK "

NAME="default-find-2-params-no-content"
TCID=$(($TCID + 1)) ;
echo "TC$TCID:$NAME started"
for SCRIPT in `echo $SCRIPTS | tr "," "\n" `
do
    echo  " $BINDIR$SCRIPT String2find ./test -nc"
    sh $BINDIR$SCRIPT String2find ./test -nc
    if [ $? -ne 0 ] ; then 
        echo "TC$TCID:$NAME failed " && exit $TCID;
    fi
done
echo "TC$TCID:$NAME OK "

NAME="txtfind-python-ext"
TCID=$(($TCID + 1)) ;
echo "TC$TCID:$NAME started"
SCRIPT=txtfind
echo  " $BINDIR$SCRIPT String2find ./test -ext py"
sh $BINDIR$SCRIPT String2find ./test -nc
if [ $? -ne 0 ] ; then 
    echo "TC$TCID:$NAME failed " && exit $TCID;
fi
echo "TC$TCID:$NAME OK "

NAME="txtfind-python-ext-filenames-only"
TCID=$(($TCID + 1)) ;
echo "TC$TCID:$NAME started"
SCRIPT=txtfind
echo  " $BINDIR$SCRIPT pyth ./test -ext py -nc"
sh $BINDIR$SCRIPT pyth ./test -ext py -nc
if [ $? -ne 0 ] ; then 
    echo "TC$TCID:$NAME failed " && exit $TCID;
fi
echo "TC$TCID:$NAME OK "


echo "tests finished OK"
ELAPSED_TIME=$((`date +'%s'` - $START_TIME))
echo "$BASENAME checked \033[42m$(($TCID - 10)) tests sets for `echo $SCRIPTS| tr "," "\n" | wc -l` scripts\033[0m, took:$(($ELAPSED_TIME/60)) min $(($ELAPSED_TIME%60)) s"

