# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit git-r3

DESCRIPTION="Compiz Manager - a script for starting compiz"
HOMEPAGE="https://github.com/compiz-reloaded"
EGIT_REPO_URI="git://github.com/compiz-reloaded/compiz-manager.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="-*"
RDEPEND="x11-apps/xvinfo"

src_install() {
    dobin compiz-manager
}


