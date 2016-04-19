# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

PYTHON_COMPAT=( python2_7 )
inherit eutils autotools python-r1 git-r3

DESCRIPTION="Compizconfig Python Bindings"
HOMEPAGE="https://github.com/compiz-reloaded"
EGIT_REPO_URI="git://github.com/compiz-reloaded/compizconfig-python.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="-*"

RDEPEND="${PYTHON_DEPS}
	>=dev-libs/glib-2.6
	dev-python/cython
	>=compiz-reloaded/libcompizconfig-${PV}"

DEPEND="${RDEPEND}
	virtual/pkgconfig"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

src_prepare(){
    eautoreconf
}

##FIXME: Do we need this? Can this package even build for python 3?
##FIXME: Works fine for me without it and I don't speak python anyway...
##src_configure() {
##	local myeconfargs=(
##		--enable-fast-install
##		--disable-static
##	)
##	python_foreach_impl autotools-utils_src_configure
##}

##src_compile() {
##	python_foreach_impl autotools-utils_src_compile
##}

##src_install() {
##	python_foreach_impl autotools-utils_src_install
##	prune_libtool_files --modules
##}

pkg_postinst() {
    elog "Do NOT report bugs about this package!"
    elog "This is a homebrewed ebuild and is not"
    elog "maintained by anyone. In fact, it might"
    elog "self-destruct at any moment... :)"
}
