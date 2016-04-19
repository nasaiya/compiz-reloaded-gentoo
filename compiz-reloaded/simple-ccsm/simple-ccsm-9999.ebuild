# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

PYTHON_COMPAT=( python2_7 )
DISTUTILS_IN_SOURCE_BUILD=1
inherit distutils-r1 gnome2-utils git-r3

DESCRIPTION="Simplified Compizconfig Settings Manager"
HOMEPAGE="https://github.com/compiz-reloaded"
EGIT_REPO_URI="git://github.com/compiz-reloaded/simple-ccsm.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="-*"
IUSE="gtk3"

DEPEND="
	dev-util/intltool
	virtual/pkgconfig"
RDEPEND="
	>=compiz-reloaded/compizconfig-python-${PV}[${PYTHON_USEDEP}]
	!gtk3? ( 
            >=dev-python/pygtk-2.12:2[${PYTHON_USEDEP}] 
            >=compiz-reloaded/ccsm-${PV}[-gtk3,${PYTHON_USEDEP}]
        )
	gtk3? ( 
            >=compiz-reloaded/ccsm-${PV}[gtk3,${PYTHON_USEDEP}]
            dev-python/pygobject 
            dev-python/pycairo 
        )
"

python_prepare_all() {
	# return error if wrong arguments passed to setup.py
	sed -i -e 's/raise SystemExit/\0(1)/' setup.py || die 'sed on setup.py failed'
	# fix desktop file
	sed -i \
		-e '/Categories/s/Compiz/X-\0/' \
		-e '/Encoding/d' \
		"${PN}".desktop.in || die "sed on ${PN}.desktop.in failed"

	distutils-r1_python_prepare_all
}

python_configure_all() {
        local myconf=""
        use gtk3 && myconf+=" --with-gtk=3.0"
        use gtk3 || myconf+=" --with-gtk=2.0"
        
        mydistutilsargs=( build \
            --prefix=/usr \
            ${myconf}
        )
}

pkg_preinst() {
        # FIXME: Is this needed/correct?
	gnome2_icon_savelist
}

pkg_postinst() {
        # FIXME: Is this needed/correct?
	gnome2_icon_cache_update

    elog "Do NOT report bugs about this package!"
    elog "This is a homebrewed ebuild and is not"
    elog "maintained by anyone. In fact, it might"
    elog "self-destruct at any moment... :)"
}

pkg_postrm() {
        # FIXME: Is this needed/correct?
	gnome2_icon_cache_update
}
