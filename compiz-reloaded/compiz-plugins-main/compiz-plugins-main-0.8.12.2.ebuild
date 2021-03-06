# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit autotools eutils

DESCRIPTION="Compiz Fusion Window Decorator Plugins"
HOMEPAGE="https://github.com/compiz-reloaded"
SRC_URI="https://github.com/compiz-reloaded/compiz-plugins-main/releases/download/v${PV}/compiz-plugins-main-${PV}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="-*"
IUSE=""

RDEPEND="
	>=gnome-base/librsvg-2.14.0:2
	x11-libs/cairo
	>=compiz-reloaded/compiz-bcop-0.8.12
	>=compiz-reloaded/compiz-0.8.12
	virtual/jpeg:0
	virtual/glu
"

DEPEND="${RDEPEND}
	>=dev-util/intltool-0.35
	virtual/pkgconfig
	>=sys-devel/gettext-0.15
"

DOCS="AUTHORS INSTALL NEWS"

src_configure() {
	econf \
		--enable-fast-install \
		--disable-static
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
