# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

DESCRIPTION="Compiz Reloaded (meta)"
HOMEPAGE="https://github.com/compiz-reloaded"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="+experimental +extra +emerald simple +fusionicon"

RDEPEND="
	>=compiz-reloaded/compiz-${PV}
	emerald? ( >=compiz-reloaded/emerald-${PV} )
	experimental? ( >=compiz-reloaded/compiz-plugins-experimental-${PV} )
	>=compiz-reloaded/compiz-plugins-main-${PV}
	extra? ( >=compiz-reloaded/compiz-plugins-extra-${PV} )
	>=compiz-reloaded/ccsm-${PV}
	simple? ( >=compiz-reloaded/simple-ccsm-${PV} )
	fusionicon? ( >=compiz-reloaded/fusion-icon-0.2.2 )
"


