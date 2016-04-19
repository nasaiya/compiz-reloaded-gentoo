# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3 autotools

DESCRIPTION="Emerald window decorator themes"
HOMEPAGE="https://github.com/compiz-reloaded"
EGIT_REPO_URI="git://github.com/compiz-reloaded/emerald-themes.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="-*"
IUSE=""
DEPEND=">=compiz-reloaded/emerald-${PV}"

DOCS="INSTALL NEWS"

# This *is* needed for the live ebuild!
src_prepare(){
    eautoreconf
}

pkg_postinst() {
    elog "Do NOT report bugs about this package!"
    elog "This is a homebrewed ebuild and is not"
    elog "maintained by anyone. In fact, it might"
    elog "self-destruct at any moment... :)"
}
