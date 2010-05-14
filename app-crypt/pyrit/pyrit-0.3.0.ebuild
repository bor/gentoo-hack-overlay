# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit eutils distutils python

DESCRIPTION="A GPU-based WPA-PSK and WPA2-PSK cracking tool"
HOMEPAGE="http://code.google.com/p/pyrit/"
SRC_URI="http://${PN}.googlecode.com/files/${P}.tar.gz
	cuda? ( http://${PN}.googlecode.com/files/cpyrit-cuda-${PV}.tar.gz )
	opencl? ( http://${PN}.googlecode.com/files/cpyrit-opencl-${PV}.tar.gz )"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="cuda opencl" # stream

DEPEND="dev-db/sqlite:3
	dev-lang/python[sqlite]
	cuda? ( x11-drivers/nvidia-drivers
		>=dev-util/nvidia-cuda-toolkit-2.2 )"
#		>=dev-util/nvidia-cuda-sdk-2.2	# we need them ?
#	opencl? ( >=dev-util/nvidia-cuda-sdk-3.0[opencl] )"	# now it masked :(
#	stream? ( >=dev-util/ati-stream-sdk-bin-2.0
#		>=x11-drivers/ati-drivers-9.11 )"
RDEPEND="${DEPEND}"

src_compile() {
	distutils_src_compile
	if use cuda; then
		cd "${WORKDIR}/cpyrit-cuda-${PV}"
		distutils_src_compile
	fi
	if use opencl; then
		cd "${WORKDIR}/cpyrit-opencl-${PV}"
		distutils_src_compile
	fi
}

src_install() {
	distutils_src_install
	if use cuda; then
		cd "${WORKDIR}/cpyrit-cuda-${PV}"
		distutils_src_install
	fi
	if use opencl; then
		cd "${WORKDIR}/cpyrit-opencl-${PV}"
		distutils_src_install
	fi
}

pkg_postinst() {
	python_mod_optimize
}

pkg_postrm() {
	python_mod_cleanup
}
