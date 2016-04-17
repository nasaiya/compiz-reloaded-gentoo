# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1 eutils gnome2-utils
MINIMUM_COMPIZ_RELEASE="0.8.12"
DESCRIPTION="Compiz Fusion Tray Icon and Manager"
HOMEPAGE="https://github.com/compiz-reloaded"
SRC_URI="https://github.com/compiz-reloaded/fusion-icon/releases/download/v${PV}/fusion-icon-${PV}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="-*"
IUSE="gtk2 +gtk3 qt4 +qt5"

REQUIRED_USE="|| ( gtk2 gtk3 qt4 qt5 ) gtk2? ( !gtk3 ) qt4? ( !qt5 )"

RDEPEND="
	>=compiz-reloaded/compizconfig-python-${MINIMUM_COMPIZ_RELEASE}
	>=compiz-reloaded/compiz-${MINIMUM_COMPIZ_RELEASE}
	x11-apps/xvinfo
	gtk2? ( 
            >=dev-python/pygtk-2.10:2[${PYTHON_USEDEP}] 
            dev-libs/libappindicator 
        )
        gtk3? ( 
            >=dev-python/pygtk-2.10:2[${PYTHON_USEDEP}] 
            dev-libs/libappindicator 
        )
	qt4? ( dev-python/PyQt4[X,${PYTHON_USEDEP}] )
	qt5? ( dev-python/PyQt5[${PYTHON_USEDEP}] )
"

DEPEND="${RDEPEND}"

## no idea why this was here or what it does
##S="${WORKDIR}/${PN}"

src_prepare(){
    if use qt4; then
        epatch "${FILESDIR}"/${P}-qt4-interface-subprocess-call.patch
    fi
}

python_prepare_all(){
	distutils-r1_python_prepare_all
}

python_configure_all() {
	local myconf=""
	use gtk2 && myconf+=" --with-gtk=2.0"
	use gtk3 && myconf+=" --with-gtk=3.0"
        use qt4 && myconf+=" --with-qt=4"
        use qt5 && myconf+=" --with-qt=5.0"
        
	mydistutilsargs=( build \
            ${myconf}
        )
}
python_install() {
	distutils-r1_python_install
	if ! use gtk2 && ! use gtk3; then
            rm -r "${D}$(python_get_sitedir)/FusionIcon/interface_gtk" || die
        fi
        if ! use qt4 && ! use qt5; then
            rm -r "${D}$(python_get_sitedir)/FusionIcon/interface_qt" || die
        fi
}

pkg_postinst() {
	use gtk2 && gnome2_icon_cache_update # is this right??
	use gtk3 && gtk-update-icon-cache

    elog "Do NOT report bugs about this package!"
    elog "This is a homebrewed ebuild and is not" 
    elog "maintained by anyone. In fact, it might" 
    elog "self-destruct at any moment... :)"

}

pkg_postrm() {
	use gtk2 && gnome2_icon_cache_update # is this right??
	use gtk3 && gtk-update-icon-cache
}
