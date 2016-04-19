# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

DESCRIPTION="Compiz Manager - a script for starting compiz"
HOMEPAGE="https://github.com/compiz-reloaded"
SRC_URI="https://github.com/compiz-reloaded/compiz-manager/releases/download/v${PV}/compiz-manager-${PV}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="-*"
RDEPEND="x11-apps/xvinfo"

src_install() {
    dobin compiz-manager
}

