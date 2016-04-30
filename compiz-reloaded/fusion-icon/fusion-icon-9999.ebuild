# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1 eutils git-r3

DESCRIPTION="Compiz Fusion Tray Icon and Manager"
HOMEPAGE="https://github.com/compiz-reloaded"
EGIT_REPO_URI="git://github.com/compiz-reloaded/fusion-icon.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="-*"
IUSE="gtk3 qt5"

# FIXME: (nasaiya) setup.py defaults to --with-qt=5.0... not sure if --with-qt=4 even works.. just removing qt4 useflag for now.
# FIXME: (nasaiya) do we need pycairo?
RDEPEND="
	>=compiz-reloaded/compizconfig-python-0.8.12
	!gtk3? ( 
            >=dev-python/pygtk-2.10:2[${PYTHON_USEDEP}] 
            dev-libs/libappindicator 
        )
        gtk3? ( 
            dev-python/pygobject 
            dev-python/pycairo 
        )
        qt5? ( 	dev-python/PyQt5[${PYTHON_USEDEP}] )
        !qt5? ( dev-python/PyQt4[X,${PYTHON_USEDEP}] )
"

DEPEND="${RDEPEND}"

python_prepare_all(){
	distutils-r1_python_prepare_all
}

python_configure_all() {
	local myconf=""
	use gtk3 || myconf+=" --with-gtk=2.0"
        use gtk3 && myconf+=" --with-gtk=3.0"

	mydistutilsargs=( build \
            ${myconf}
        )
}
python_install() {
	distutils-r1_python_install
	
	# FIXME: (nasaiya) It doesn't seem to hurt anything to have both gtk and qt interfaces installed on my system...
	# FIXME: (nasaiya) do we really need have use flags just for the following?
	#use gtk || rm -r "${D}$(python_get_sitedir)/FusionIcon/interface_gtk" || die
        #use qt || rm -r "${D}$(python_get_sitedir)/FusionIcon/interface_qt" || die
}

pkg_postinst() {
#	use gtk3 || gnome2_icon_cache_update # is this right??
	use gtk3 && gtk-update-icon-cache

    elog "Do NOT report bugs about this package!"
    elog "This is a homebrewed ebuild and is not"
    elog "maintained by anyone. In fact, it might"
    elog "self-destruct at any moment... :)"

}

pkg_postrm() {
#	use gtk3 || gnome2_icon_cache_update # is this right??
	use gtk3 && gtk-update-icon-cache
}
