# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

inherit eutils autotools flag-o-matic git-r3

DESCRIPTION="Emerald Window Decorator"
HOMEPAGE="https://github.com/compiz-reloaded"
EGIT_REPO_URI="git://github.com/compiz-reloaded/emerald.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="-*"
IUSE=""

PDEPEND=">=compiz-reloaded/emerald-themes-${PV}"

RDEPEND="
	>=x11-libs/gtk+-2.8.0:2
	x11-libs/libwnck:3
	>=compiz-reloaded/compiz-${PV}
"

DEPEND="${RDEPEND}
	>=dev-util/intltool-0.35
	virtual/pkgconfig
	>=sys-devel/gettext-0.15
"

DOCS=( AUTHORS INSTALL NEWS TODO )

src_prepare() {
	# Fix pkg-config file pollution wrt #380197
	epatch "${FILESDIR}"/${P}-pkgconfig-pollution.patch
	# fix build with gtk+-2.22 - bug 341143
	sed -i -e '/#define G[DT]K_DISABLE_DEPRECATED/s:^://:' \
		include/emerald.h || die
	# Fix underlinking
	append-libs -ldl -lm

	epatch_user
	
	eautoreconf
}

src_configure() {
	econf \
		--disable-static \
		--enable-fast-install \
		--disable-mime-update
}

src_install() {
	default
	prune_libtool_files
}

pkg_postinst() {
    elog "Do NOT report bugs about this package!"
    elog "This is a homebrewed ebuild and is not" 
    elog "maintained by anyone. In fact, it might" 
    elog "self-destruct at any moment... :)"
}

