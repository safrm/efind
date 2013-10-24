%define buildroot %{_topdir}/%{name}-%{version}-root
%define APP_BUILD_DATE %(date +'%%Y%%m%%d_%%H%%M')

Name:       efind
Summary:    Extended search for documents
Version:    1.0.0
Release:    1
Group:      Development/Tools
License:    LGPL v2.1
BuildArch:  noarch
URL:        http://safrm.net/projects/efind/
Vendor:     Miroslav Safr <miroslav.safr@gmail.com>
Source0:    %{name}-%{version}.tar.bz2
Autoreq: on
Autoreqprov: on
BuildRoot: %{buildroot}

%description
Extended search for documents using common shell utilities


%prep
%setup -c -n ./%{name}-%{version}
# >> setup
# << setup

%build
# >> build post
# << build post

%install
rm -fr $RPM_BUILD_ROOT
# >> install pre
export INSTALL_ROOT=$RPM_BUILD_ROOT
# << install pre 
mkdir -p %{buildroot}/usr/bin
install -m 755 ./efind %{buildroot}/usr/bin/
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=%{version}/" %{buildroot}/usr/bin/efind && rm -f %{buildroot}/usr/bin/efind.bkp
sed -i".bkp" "1,/^VERSION_DATE=/s/^VERSION_DATE=.*/VERSION_DATE=%{APP_BUILD_DATE}/" %{buildroot}/usr/bin/efind && rm -f %{buildroot}/usr/bin/efind.bkp
install -m 755 ./cppfind %{buildroot}/usr/bin/
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=%{version}/" %{buildroot}/usr/bin/cppfind && rm -f %{buildroot}/usr/bin/cppfind.bkp
sed -i".bkp" "1,/^VERSION_DATE=/s/^VERSION_DATE=.*/VERSION_DATE=%{APP_BUILD_DATE}/" %{buildroot}/usr/bin/cppfind && rm -f %{buildroot}/usr/bin/cppfind.bkp
install -m 755 ./docfind %{buildroot}/usr/bin/
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=%{version}/" %{buildroot}/usr/bin/docfind && rm -f %{buildroot}/usr/bin/docfind.bkp
sed -i".bkp" "1,/^VERSION_DATE=/s/^VERSION_DATE=.*/VERSION_DATE=%{APP_BUILD_DATE}/" %{buildroot}/usr/bin/docfind && rm -f %{buildroot}/usr/bin/docfind.bkp
install -m 755 ./gcfind %{buildroot}/usr/bin/
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=%{version}/" %{buildroot}/usr/bin/gcfind && rm -f %{buildroot}/usr/bin/gcfind.bkp
sed -i".bkp" "1,/^VERSION_DATE=/s/^VERSION_DATE=.*/VERSION_DATE=%{APP_BUILD_DATE}/" %{buildroot}/usr/bin/gcfind && rm -f %{buildroot}/usr/bin/gcfind.bkp
install -m 755 ./htmlfind %{buildroot}/usr/bin/
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=%{version}/" %{buildroot}/usr/bin/htmlfind && rm -f %{buildroot}/usr/bin/htmlfind.bkp
sed -i".bkp" "1,/^VERSION_DATE=/s/^VERSION_DATE=.*/VERSION_DATE=%{APP_BUILD_DATE}/" %{buildroot}/usr/bin/htmlfind && rm -f %{buildroot}/usr/bin/htmlfind.bkp
install -m 755 ./javafind %{buildroot}/usr/bin/
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=%{version}/" %{buildroot}/usr/bin/javafind && rm -f %{buildroot}/usr/bin/javafind.bkp
sed -i".bkp" "1,/^VERSION_DATE=/s/^VERSION_DATE=.*/VERSION_DATE=%{APP_BUILD_DATE}/" %{buildroot}/usr/bin/javafind && rm -f %{buildroot}/usr/bin/javafind.bkp
install -m 755 ./pdffind %{buildroot}/usr/bin/
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=%{version}/" %{buildroot}/usr/bin/pdffind && rm -f %{buildroot}/usr/bin/pdffind.bkp
sed -i".bkp" "1,/^VERSION_DATE=/s/^VERSION_DATE=.*/VERSION_DATE=%{APP_BUILD_DATE}/" %{buildroot}/usr/bin/pdffind && rm -f %{buildroot}/usr/bin/pdffind.bkp
install -m 755 ./pptfind %{buildroot}/usr/bin/
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=%{version}/" %{buildroot}/usr/bin/pptfind && rm -f %{buildroot}/usr/bin/pptfind.bkp
sed -i".bkp" "1,/^VERSION_DATE=/s/^VERSION_DATE=.*/VERSION_DATE=%{APP_BUILD_DATE}/" %{buildroot}/usr/bin/pptfind && rm -f %{buildroot}/usr/bin/pptfind.bkp
install -m 755 ./shfind %{buildroot}/usr/bin/
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=%{version}/" %{buildroot}/usr/bin/shfind && rm -f %{buildroot}/usr/bin/shfind.bkp
sed -i".bkp" "1,/^VERSION_DATE=/s/^VERSION_DATE=.*/VERSION_DATE=%{APP_BUILD_DATE}/" %{buildroot}/usr/bin/shfind && rm -f %{buildroot}/usr/bin/shfind.bkp
install -m 755 ./specfind %{buildroot}/usr/bin/
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=%{version}/" %{buildroot}/usr/bin/specfind && rm -f %{buildroot}/usr/bin/specfind.bkp
sed -i".bkp" "1,/^VERSION_DATE=/s/^VERSION_DATE=.*/VERSION_DATE=%{APP_BUILD_DATE}/" %{buildroot}/usr/bin/specfind && rm -f %{buildroot}/usr/bin/specfind.bkp
install -m 755 ./txtfind %{buildroot}/usr/bin/
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=%{version}/" %{buildroot}/usr/bin/txtfind && rm -f %{buildroot}/usr/bin/txtfind.bkp
sed -i".bkp" "1,/^VERSION_DATE=/s/^VERSION_DATE=.*/VERSION_DATE=%{APP_BUILD_DATE}/" %{buildroot}/usr/bin/txtfind && rm -f %{buildroot}/usr/bin/txtfind.bkp
install -m 755 ./xmlfind %{buildroot}/usr/bin/
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=%{version}/" %{buildroot}/usr/bin/xmlfind && rm -f %{buildroot}/usr/bin/xmlfind.bkp
sed -i".bkp" "1,/^VERSION_DATE=/s/^VERSION_DATE=.*/VERSION_DATE=%{APP_BUILD_DATE}/" %{buildroot}/usr/bin/xmlfind && rm -f %{buildroot}/usr/bin/xmlfind.bkp
# >> install post
# << install post


%files
%defattr(-,root,root,-)
# >> files
%{_bindir}/efind
%{_bindir}/cppfind
%{_bindir}/docfind
%{_bindir}/gcfind
%{_bindir}/htmlfind
%{_bindir}/javafind
%{_bindir}/pdffind
%{_bindir}/pptfind
%{_bindir}/shfind
%{_bindir}/specfind
%{_bindir}/txtfind
%{_bindir}/xmlfind
# << files


