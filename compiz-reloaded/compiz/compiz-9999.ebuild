# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit autotools eutils gnome2-utils git-r3

DESCRIPTION="OpenGL window and compositing manager"
HOMEPAGE="https://github.com/compiz-reloaded"
EGIT_REPO_URI="git://github.com/compiz-reloaded/compiz.git"

LICENSE="GPL-2 LGPL-2.1 MIT"
SLOT="0"
KEYWORDS="-*"
IUSE="+cairo dbus fuse gtk +svg inotify"

COMMONDEPEND="
	>=dev-libs/glib-2
	dev-libs/libxml2
	dev-libs/libxslt
	media-libs/libpng:0=
	>=media-libs/mesa-10.3.7-r1
	>=x11-base/xorg-server-1.12.4-r5
	>=x11-libs/libX11-1.6.2
	x11-libs/libxcb
	x11-libs/libXcomposite
	x11-libs/libXdamage
	x11-libs/libXinerama
	x11-libs/libXrandr
	x11-libs/libICE
	x11-libs/libSM
	>=x11-libs/libXrender-0.9.8
	>=x11-libs/startup-notification-0.12
	virtual/glu
	cairo? (
		>=x11-libs/cairo-1.14.2[X]
	)
	dbus? (
		>=sys-apps/dbus-1.0
		dev-libs/dbus-glib
	)
	fuse? ( sys-fs/fuse )
	gtk? (
		>=x11-libs/gtk+-2.8.0:2
		>=x11-libs/libwnck-2.18.3:1
		x11-libs/pango
	)
	svg? (
		>=gnome-base/librsvg-2.14.0:2
		>=x11-libs/cairo-1.4
	)
"

DEPEND="${COMMONDEPEND}
	virtual/pkgconfig
	x11-proto/damageproto
	x11-proto/xineramaproto
"

RDEPEND="${COMMONDEPEND}
	x11-apps/mesa-progs
	x11-apps/xdpyinfo
	x11-apps/xset
	x11-apps/xvinfo
"

DOCS=( AUTHORS ChangeLog NEWS TODO )

src_prepare() {
	echo gtk/gnome/compiz-wm.desktop.in >> po/POTFILES.skip
	echo metadata/core.xml.in >> po/POTFILES.skip

	eautoreconf
}

src_configure() {
	econf \
		--enable-fast-install \
		--disable-static \
		$(use_enable svg librsvg) \
		$(use_enable cairo annotate) \
		$(use_enable dbus) \
		$(use_enable dbus dbus-glib) \
		$(use_enable fuse) \
		$(use_enable gtk) \
		$(use_enable inotify)
}

src_install() {
	default
	prune_libtool_files --all
}

pkg_postinst() {
    elog "Do NOT report bugs about this package!"
    elog "This is a homebrewed ebuild and is not"
    elog "maintained by anyone. In fact, it might"
    elog "self-destruct at any moment... :)"
}
