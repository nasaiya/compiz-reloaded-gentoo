# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="4"

inherit autotools eutils git-r3

DESCRIPTION="Compiz Fusion Window Decorator Extra Plugins"
HOMEPAGE="http://www.compiz.org/"
##SRC_URI="http://releases.compiz.org/${PV}/${P}.tar.bz2"
EGIT_REPO_URI="git://github.com/compiz-reloaded/compiz-plugins-extra.git"


LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"
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
        ## patches don't work in compiz-reloaded
	##epatch "${FILESDIR}/${P}-libnotify.patch"

	eautoreconf
}

src_configure() {
	econf \
		--enable-fast-install \
		--disable-static \
		$(use_with libnotify notifications)
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
