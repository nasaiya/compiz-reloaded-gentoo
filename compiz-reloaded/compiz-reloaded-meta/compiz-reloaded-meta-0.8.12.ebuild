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
IUSE="+gtk3 gtk2 +experimental +extra +emerald +ccsm simpleccsm +fusionicon manager"
REQUIRED_USE="^^ ( gtk2 gtk3 )"
RDEPEND="
	gtk2? ( >=compiz-reloaded/compiz-${PV}[gtk2] )
	gtk3? ( >=compiz-reloaded/compiz-${PV}[gtk3] )
	emerald? ( 
            gtk2? ( >=compiz-reloaded/emerald-${PV}[gtk2] )
            gtk3? ( >=compiz-reloaded/emerald-${PV}[gtk3] )
        )
	experimental? ( >=compiz-reloaded/compiz-plugins-experimental-${PV} )
	>=compiz-reloaded/compiz-plugins-main-${PV}
	extra? ( >=compiz-reloaded/compiz-plugins-extra-${PV} )
	ccsm? (
            gtk2? ( >=compiz-reloaded/ccsm-${PV}[gtk2] )
            gtk3? ( >=compiz-reloaded/ccsm-${PV}[gtk3] )
        )
	simpleccsm? ( >=compiz-reloaded/simple-ccsm-${PV} )
	fusionicon? ( 
            gtk2? ( >=compiz-reloaded/fusion-icon-0.2.2[gtk2] )
            gtk3? ( >=compiz-reloaded/fusion-icon-0.2.2[gtk3] )
        )
        manager? ( >=compiz-reloaded/compiz-manager-0.7.0 )
"


