# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="WLAN tools for bruteforcing 802.11 WPA/WPA2 keys"
HOMEPAGE="http://www.willhackforsushi.com/?page_id=50"
SRC_URI="http://www.willhackforsushi.com/code/${PN}/${PV}/${P}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-libs/openssl
	net-libs/libpcap"
RDEPEND="${DEPEND}"

src_compile() {
	emake || die "emake failed"
}

src_install() {
	dobin cowpatty genpmk || die "dobin failed"
	dodoc AUTHORS CHANGELOG FAQ INSTALL README TODO dict *.dump
}
