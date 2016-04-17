# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=4

inherit autotools

DESCRIPTION="Compiz Option code Generator"
HOMEPAGE="https://github.com/compiz-reloaded"
SRC_URI="https://github.com/compiz-reloaded/compiz-bcop/releases/download/v${PV}/compiz-bcop-${PV}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"
IUSE=""

RDEPEND="dev-libs/libxslt"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

DOCS="AUTHORS INSTALL NEWS"

src_prepare(){
    eautoreconf
}

pkg_postinst() {
    elog "Do NOT report bugs about this package!"
    elog "This is a homebrewed ebuild and is not" 
    elog "maintained by anyone. In fact, it might" 
    elog "self-destruct at any moment... :)"
}

