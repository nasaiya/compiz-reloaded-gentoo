# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit autotools eutils gnome2-utils

DESCRIPTION="OpenGL window and compositing manager"
HOMEPAGE="https://github.com/compiz-reloaded/compiz"
SRC_URI="https://github.com/compiz-reloaded/compiz/archive/v0.8.12.3.zip"

LICENSE="GPL-2 LGPL-2.1 MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+cairo dbus fuse gtk +svg"

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
		x11-libs/cairo[X]
	)
	dbus? (
		>=sys-apps/dbus-1.8.16
		dev-libs/dbus-glib
	)
	fuse? ( sys-fs/fuse )
	gtk? (
		>=x11-libs/gtk+-2.24.28-r1:2
		>=x11-libs/libwnck-2.31.0:1
		x11-libs/pango
	)
	svg? (
		>=gnome-base/librsvg-2.40.11:2
		>=x11-libs/cairo-1.14.2
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

DOCS=( AUTHORS ChangeLog NEWS README TODO )

src_prepare() {
	echo gtk/gnome/compiz-wm.desktop.in >> po/POTFILES.skip
	echo metadata/core.xml.in >> po/POTFILES.skip

	eautoreconf
}

src_configure() {
	local myconf

	econf \
		--enable-fast-install \
		--disable-static \
		--with-default-plugins \
		${myconf}
}

src_install() {
	prune_libtool_files --all

	#cat <<- EOF > "${D}/etc/xdg/compiz/compiz-manager"
	COMPIZ_BIN_PATH="/usr/bin/"
	PLUGIN_PATH="/usr/$(get_libdir)/compiz/"
	LIBGL_NVIDIA="/usr/$(get_libdir)/opengl/xorg-x11/lib/libGL.so.1.2"
	LIBGL_FGLRX="/usr/$(get_libdir)/opengl/xorg-x11/lib/libGL.so.1.2"
	SKIP_CHECKS="yes"
	EOF

	domenu "${FILESDIR}"/compiz.desktop
}
