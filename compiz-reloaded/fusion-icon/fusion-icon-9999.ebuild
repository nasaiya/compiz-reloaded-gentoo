# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1 eutils gnome2-utils git-r3

MINIMUM_COMPIZ_RELEASE=0.6.0

DESCRIPTION="Compiz Fusion Tray Icon and Manager"
HOMEPAGE="http://compiz.org"
##SRC_URI="mirror://gentoo/${P}.tar.gz"
EGIT_REPO_URI="git://github.com/compiz-reloaded/fusion-icon.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+gtk qt4"

REQUIRED_USE="|| ( gtk qt4 )"

RDEPEND="
	>=compiz-reloaded/compizconfig-python-${MINIMUM_COMPIZ_RELEASE}
	>=compiz-reloaded/compiz-${MINIMUM_COMPIZ_RELEASE}
	x11-apps/xvinfo
	gtk? ( >=dev-python/pygtk-2.10:2[${PYTHON_USEDEP}] )
	qt4? ( dev-python/PyQt4[X,${PYTHON_USEDEP}] )"
DEPEND="${RDEPEND}"

## no idea why this was here
##S="${WORKDIR}/${PN}"

## patches don't work
##PATCHES=( "${FILESDIR}"/${P}-qt4-interface-subprocess-call.patch )

python_install() {
	distutils-r1_python_install
	use gtk || rm -r "${D}$(python_get_sitedir)/FusionIcon/interface_gtk" || die
	use qt4 || rm -r "${D}$(python_get_sitedir)/FusionIcon/interface_qt" || die
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
