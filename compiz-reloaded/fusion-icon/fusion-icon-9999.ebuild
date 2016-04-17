# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1 eutils gnome2-utils git-r3

MINIMUM_COMPIZ_RELEASE=0.6.0

DESCRIPTION="Compiz Fusion Tray Icon and Manager"
HOMEPAGE="https://github.com/compiz-reloaded"
EGIT_REPO_URI="git://github.com/compiz-reloaded/fusion-icon.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gtk qt4 qt5"

REQUIRED_USE="gtk? ( !qt4 !qt5 ) qt4? ( !qt5 )"

RDEPEND="
	>=compiz-reloaded/compizconfig-python-${MINIMUM_COMPIZ_RELEASE}
	>=compiz-reloaded/compiz-${MINIMUM_COMPIZ_RELEASE}
	x11-apps/xvinfo
	gtk? ( >=dev-python/pygtk-2.10:2[${PYTHON_USEDEP}] )
	gtk? ( dev-libs/libappindicator )
	qt4? ( dev-python/PyQt4[X,${PYTHON_USEDEP}] )
	qt5? ( dev-python/PyQt5[${PYTHON_USEDEP}] )
"

DEPEND="${RDEPEND}"

## no idea why this was here
##S="${WORKDIR}/${PN}"

src_prepare(){
    if use qt4; then
        epatch "${FILESDIR}"/${P}-qt4-interface-subprocess-call.patch
    fi
}

python_install() {
	distutils-r1_python_install
	if use gtk; then
            rm -r "${D}$(python_get_sitedir)/FusionIcon/interface_qt" || die
        else
            rm -r "${D}$(python_get_sitedir)/FusionIcon/interface_gtk" || die
        fi
}

pkg_postinst() {
	use gtk && gnome2_icon_cache_update

    elog "Do NOT report bugs about this package!"
    elog "This is a homebrewed ebuild and is not" 
    elog "maintained by anyone. In fact, it might" 
    elog "self-destruct at any moment... :)"

}

pkg_postrm() {
	use gtk && gnome2_icon_cache_update
}
