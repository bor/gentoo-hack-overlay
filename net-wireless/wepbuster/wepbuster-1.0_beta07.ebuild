# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

MY_PV="1.0_beta-0.7"

DESCRIPTION="This script executes various programs included in the aircrack-ng suite"
HOMEPAGE="http://code.google.com/p/wepbuster/"
SRC_URI="http://wepbuster.googlecode.com/files/${PN}-${MY_PV}.tgz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-lang/perl[ithreads]"
RDEPEND="${DEPEND}
dev-perl/Expect
dev-perl/File-Slurp
dev-perl/TermReadKey
net-analyzer/macchanger
net-wireless/aircrack-ng
net-wireless/wireless-tools"

S="${WORKDIR}/${PN}-${PV/_beta*/_beta}"

src_install() {
	dobin ${PN}
	dodoc CHANGELOG
}

pkg_postinst() {
	ewarn "You also need install some additional perl module:"
	ewarn "  Algorithm::Permute"
	ewarn "  Number::Range"
	ewarn "You can use app-portage/g-cpan(recommended) util for it:"
	ewarn "  g-cpan -i Algorithm::Permute Number::Range"
	ewarn " or install directrly from cpan"
}
