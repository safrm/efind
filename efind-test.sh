#!/bin/sh
#extended recursive search for documents - sh script files (sh, sh scripts without extension)
#web: http://safrm.net/projects/efind
#author: Miroslav Safr <miroslav.safr@gmail.com> 
VERSION=NA                                                                   
VERSION_DATE=NA
BASENAME=`basename $0`
usage() {
    echo "$BASENAME ${VERSION} - extended recursive search testing script "
    echo " http://safrm,net/projects/efind/"
    echo "Usage:$BASENAME"
    echo " options: "
    echo " --help ............................. shows command line help"
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
    --help) usage exit ;;
    -cs) CASE_SENS=1 ;;
    -nf | --no-filenames )  SEARCH_FILENAMES=0 ;;
    -nc | --no-content )  SEARCH_CONTENT=0 ;;
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

SCRIPTS=cppfind,docfind,htmlfind,javafind,pdffind,pptfind,shfind,txtfind,xmlfind,efind
echo "scripts count: `echo $SCRIPTS| tr "," "\n" | wc -l`"


NAME="--help"
echo "TC:$NAME started"
for SCRIPT in `echo $SCRIPTS | tr "," "\n" `
do
    echo  " $SCRIPT --help"
    $SCRIPT --help
    if [ $? -ne 1 ] ; then 
        echo "TC:$NAME failed " && exit 1;
    fi
done
echo "TC:$NAME OK "

NAME="no-pattern"
echo "TC:$NAME started"
for SCRIPT in `echo $SCRIPTS | tr "," "\n" `
do
    echo  " $SCRIPT "
    $SCRIPT 
    if [ $? -ne 1 ] ; then 
        echo "TC:$NAME failed " && exit 1;
    fi
done
echo "TC:$NAME OK "

NAME="default-find-2-params"
echo "TC:$NAME started"
for SCRIPT in `echo $SCRIPTS | tr "," "\n" `
do
    echo  " $SCRIPT String2find ./test"
    $SCRIPT String2find ./test
    if [ $? -ne 0 ] ; then 
        echo "TC:$NAME failed " && exit 1;
    fi
done
echo "TC:$NAME OK "

NAME="default-find-2-params-only-names"
echo "TC:$NAME started"
for SCRIPT in `echo $SCRIPTS | tr "," "\n" `
do
    echo  " $SCRIPT String2find ./test -no"
    $SCRIPT String2find ./test -no
    if [ $? -ne 0 ] ; then 
        echo "TC:$NAME failed " && exit 1;
    fi
done

NAME="default-find-2-params-case-sensitive"
echo "TC:$NAME started"
for SCRIPT in `echo $SCRIPTS | tr "," "\n" `
do
    echo  " $SCRIPT String2find ./test -cs"
    $SCRIPT String2find ./test -cs
    if [ $? -ne 0 ] ; then 
        echo "TC:$NAME failed " && exit 1;
    fi
done

NAME="default-find-2-params-no-filenames"
echo "TC:$NAME started"
for SCRIPT in `echo $SCRIPTS | tr "," "\n" `
do
    echo  " $SCRIPT String2find ./test -nf"
    $SCRIPT String2find ./test -nf
    if [ $? -ne 0 ] ; then 
        echo "TC:$NAME failed " && exit 1;
    fi
done

NAME="default-find-2-params-no-content"
echo "TC:$NAME started"
for SCRIPT in `echo $SCRIPTS | tr "," "\n" `
do
    echo  " $SCRIPT String2find ./test -nc"
    $SCRIPT String2find ./test -nc
    if [ $? -ne 0 ] ; then 
        echo "TC:$NAME failed " && exit 1;
    fi
done

  ELAPSED_TIME=$((`date +'%s'` - $START_TIME))
  echo "$BASENAME found \033[42m$FOUND_COUNT_FN/$FOUND_COUNT from $FILES_COUNT \033[0m files, took:$(($ELAPSED_TIME/60)) min $(($ELAPSED_TIME%60)) s"

