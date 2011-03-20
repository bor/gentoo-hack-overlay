# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit base eutils

DESCRIPTION="MD5 brute force hash cracker using GPU (Nvidia Graphic Processor)"
HOMEPAGE="http://bvernoux.free.fr/md5/index.php"
SRC_URI="http://bvernoux.free.fr/md5/uploadFile?id=3
	-> ${PN}_${PV}_lgpl.zip"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-libs/openssl"
DEPEND="${RDEPEND}
	<sys-devel/gcc-4.4
	~dev-util/nvidia-cuda-toolkit-2.2"

S="${WORKDIR}/GPU_MD5_Crack_${PV}_LGPL"

#PATCHES=( "${FILESDIR}"/${PN}-gcc-4.4.patch )

pkg_setup() {
	if [ "$(gcc-major-version)" == "4" -a $(gcc-minor-version) -ge 4 ]; then
		eerror "This package requires <sys-devel/gcc-4.4 to build sucessfully."
		eerror "Please use gcc-config to switch to a compatible GCC version."
		die "<sys-devel/gcc-4.4 required"
	fi
}

src_install() {
	newbin bin/linux/release/${PN}_${PV} ${PN}
	#dodoc doc/Usage.txt
}
