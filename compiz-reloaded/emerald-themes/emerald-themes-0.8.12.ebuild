# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit autotools

DESCRIPTION="Emerald window decorator themes"
HOMEPAGE="https://github.com/compiz-reloaded"
SRC_URI="https://github.com/compiz-reloaded/emerald-themes/releases/download/v${PV}/emerald-themes-${PV}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="-*"
IUSE=""
DEPEND=">=compiz-reloaded/emerald-0.8.12"

DOCS="INSTALL NEWS"

pkg_postinst() {
    elog "Do NOT report bugs about this package!"
    elog "This is a homebrewed ebuild and is not"
    elog "maintained by anyone. In fact, it might"
    elog "self-destruct at any moment... :)"
}
