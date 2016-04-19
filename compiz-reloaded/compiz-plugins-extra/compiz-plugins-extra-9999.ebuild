# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit autotools eutils git-r3

DESCRIPTION="Compiz Fusion Window Decorator Extra Plugins"
HOMEPAGE="https://github.com/compiz-reloaded"
EGIT_REPO_URI="git://github.com/compiz-reloaded/compiz-plugins-extra.git"


LICENSE="GPL-2"
SLOT="0"
KEYWORDS="-*"
IUSE="libnotify"

RDEPEND="
	>=gnome-base/librsvg-2.14.0:2
	virtual/jpeg:0
	>=compiz-reloaded/compiz-bcop-${PV}
	>=compiz-reloaded/compiz-plugins-main-${PV}
	>=compiz-reloaded/compiz-${PV}
	libnotify? ( x11-libs/libnotify )
"

DEPEND="${RDEPEND}
	>=dev-util/intltool-0.35
	virtual/pkgconfig
	>=sys-devel/gettext-0.15
	x11-libs/cairo
"

DOCS="AUTHORS INSTALL NEWS"

src_prepare() {
	epatch "${FILESDIR}/${P}-libnotify.patch"
	eautoreconf
}

src_configure() {
	econf \
		--enable-fast-install \
		--disable-static \
		$(use_enable libnotify notifications)
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
