# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=4
inherit eutils git-r3 autotools

DESCRIPTION="Compiz Configuration System"
HOMEPAGE="https://github.com/compiz-reloaded"
EGIT_REPO_URI="git://github.com/compiz-reloaded/libcompizconfig.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"
IUSE=""

RDEPEND="dev-libs/libxml2
	dev-libs/protobuf
	>=compiz-reloaded/compiz-${PV}
	x11-libs/libX11"
DEPEND="${RDEPEND}
	>=dev-util/intltool-0.41
	virtual/pkgconfig
	x11-proto/xproto"

RESTRICT="test"

src_prepare() {
    eautoreconf
}

src_configure() {
	econf \
		--enable-fast-install \
		--disable-static
}

src_install() {
	emake DESTDIR="${D}" install
	dodoc TODO
	prune_libtool_files --all
}

pkg_postinst() {
    elog "Do NOT report bugs about this package!"
    elog "This is a homebrewed ebuild and is not" 
    elog "maintained by anyone. In fact, it might" 
    elog "self-destruct at any moment... :)"
}

