# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

inherit eutils autotools flag-o-matic

DESCRIPTION="Emerald Window Decorator"
HOMEPAGE="https://github.com/compiz-reloaded"
SRC_URI="https://github.com/compiz-reloaded/emerald/releases/download/v${PV}/emerald-${PV}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="-*"
IUSE="gtk3"

PDEPEND=">=compiz-reloaded/emerald-themes-0.8.12"

RDEPEND="
	!gtk3? (
            >=x11-libs/gtk+-2.8.0:2
            >=x11-libs/libwnck-2.22:1
        )
	gtk3? ( 
            x11-libs/gtk+:3 
            x11-libs/libwnck:3
        )
"

DEPEND="${RDEPEND}
	>=dev-util/intltool-0.35
	virtual/pkgconfig
	>=sys-devel/gettext-0.15
"

DOCS=( AUTHORS INSTALL NEWS TODO )

src_prepare() {
	# Fix underlinking
	append-libs -ldl -lm

	epatch_user

	eautoreconf
}

src_configure() {
        local myconf=""
	use gtk3 || myconf+=" --with-gtk=2.0"
	use gtk3 && myconf+=" --with-gtk=3.0"

	econf \
		--disable-static \
		--enable-fast-install \
		--disable-mime-update \
		${myconf}
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
