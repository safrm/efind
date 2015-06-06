#/bin/sh
#efind - extended search for documents  - http://safrm.net/projects/efind
#author:  Miroslav Safr <miroslav.safr@gmail.com>
. appver-installer

#own tests
./efind-test.sh -ld

mkdir -p -m 0755 $BINDIR
$INSTALL_755 ./efind $BINDIR
update_version_and_date $BINDIR/efind
$INSTALL_755 ./cppfind $BINDIR
update_version_and_date $BINDIR/cppfind
$INSTALL_755 ./docfind $BINDIR
update_version_and_date $BINDIR/docfind
$INSTALL_755 ./gcfind $BINDIR
update_version_and_date $BINDIR/gcfind
$INSTALL_755 ./htmlfind $BINDIR
update_version_and_date $BINDIR/htmlfind
$INSTALL_755 ./javafind $BINDIR
update_version_and_date $BINDIR/javafind
$INSTALL_755 ./pdffind $BINDIR
update_version_and_date $BINDIR/pdffind
$INSTALL_755 ./pptfind $BINDIR
update_version_and_date $BINDIR/pptfind
$INSTALL_755 ./shfind $BINDIR
update_version_and_date $BINDIR/shfind
$INSTALL_755 ./specfind $BINDIR
update_version_and_date $BINDIR/specfind
$INSTALL_755 ./txtfind $BINDIR
update_version_and_date $BINDIR/txtfind
$INSTALL_755 ./todofind $BINDIR
update_version_and_date $BINDIR/todofind
$INSTALL_755 ./xmlfind $BINDIR
update_version_and_date $BINDIR/xmlfind
$INSTALL_755 ./pyfind $BINDIR
update_version_and_date $BINDIR/pyfind

mkdir -p -m 0755 $COMPLETION_DIR
$INSTALL_755 ./efind_completion  $COMPLETION_DIR

MANPAGES=`find ./doc/manpages -type f`
mkdir -p -m 755 $MANDIR/man1
$INSTALL_644 $MANPAGES $MANDIR/man1

