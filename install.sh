#/bin/sh
#efind - extended search for documents  - http://safrm.net/projects/efind
#author:  Miroslav Safr <miroslav.safr@gmail.com>
. appver-installer

#own tests
./efind-test.sh -ld

$MKDIR_755 $BINDIR
$INSTALL_755 ./efind $BINDIR
appver_update_version_and_date $BINDIR/efind
$INSTALL_755 ./cppfind $BINDIR
appver_update_version_and_date $BINDIR/cppfind
$INSTALL_755 ./docfind $BINDIR
appver_update_version_and_date $BINDIR/docfind
$INSTALL_755 ./gcfind $BINDIR
appver_update_version_and_date $BINDIR/gcfind
$INSTALL_755 ./htmlfind $BINDIR
appver_update_version_and_date $BINDIR/htmlfind
$INSTALL_755 ./javafind $BINDIR
appver_update_version_and_date $BINDIR/javafind
$INSTALL_755 ./pdffind $BINDIR
appver_update_version_and_date $BINDIR/pdffind
$INSTALL_755 ./pptfind $BINDIR
appver_update_version_and_date $BINDIR/pptfind
$INSTALL_755 ./shfind $BINDIR
appver_update_version_and_date $BINDIR/shfind
$INSTALL_755 ./specfind $BINDIR
appver_update_version_and_date $BINDIR/specfind
$INSTALL_755 ./txtfind $BINDIR
appver_update_version_and_date $BINDIR/txtfind
$INSTALL_755 ./todofind $BINDIR
appver_update_version_and_date $BINDIR/todofind
$INSTALL_755 ./xmlfind $BINDIR
appver_update_version_and_date $BINDIR/xmlfind
$INSTALL_755 ./pyfind $BINDIR
appver_update_version_and_date $BINDIR/pyfind

$MKDIR_755 $COMPLETION_DIR
$INSTALL_755 ./efind_completion  $COMPLETION_DIR

