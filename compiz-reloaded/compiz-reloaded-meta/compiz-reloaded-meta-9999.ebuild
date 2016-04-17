# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Compiz Reloaded (meta)"
HOMEPAGE="https://github.com/compiz-reloaded"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="experimental emerald"

RDEPEND="
	>=compiz-reloaded/compiz-${PV}
	emerald? ( >=compiz-reloaded/emerald-${PV} )
	experimental? ( >=compiz-reloaded/compiz-plugins-experimental-${PV} )
	>=compiz-reloaded/compiz-plugins-main-${PV}
	>=compiz-reloaded/compiz-plugins-extra-${PV}
	>=compiz-reloaded/ccsm-${PV}
	>=compiz-reloaded/simple-ccsm-${PV}
	>=compiz-reloaded/fusion-icon-${PV}
"


