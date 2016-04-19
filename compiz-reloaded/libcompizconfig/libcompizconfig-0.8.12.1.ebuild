# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit eutils autotools

DESCRIPTION="Compiz Configuration System"
HOMEPAGE="https://github.com/compiz-reloaded"
SRC_URI="https://github.com/compiz-reloaded/libcompizconfig/releases/download/v${PV}/libcompizconfig-${PV}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="-*"

RDEPEND="dev-libs/libxml2
	dev-libs/protobuf
	>=compiz-reloaded/compiz-0.8.12
	x11-libs/libX11"
DEPEND="${RDEPEND}
	>=dev-util/intltool-0.41
	virtual/pkgconfig
	x11-proto/xproto"

src_configure() {
	econf \
		--enable-fast-install \
		--disable-static
}

src_install() {
        # FIXME: Is this next line necessary?
	emake DESTDIR="${D}" install

	prune_libtool_files --all
}

pkg_postinst() {
    elog "Do NOT report bugs about this package!"
    elog "This is a homebrewed ebuild and is not"
    elog "maintained by anyone. In fact, it might"
    elog "self-destruct at any moment... :)"
}
