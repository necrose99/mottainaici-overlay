# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

EGO_PN="github.com/MottainaiCI/${PN}"
S="${WORKDIR}/${P}/src/${EGO_PN}"

if [[ ${PV} == *9999 ]]; then
	inherit golang-vcs
else
	#SRC_URI="https://${EGO_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
	#inherit golang-vcs-snapshot
	RESTRICT="mirror"
	inherit golang-vcs git-r3
	EGIT_REPO_URI="https://${EGO_PN}"
	EGIT_COMMIT="c9ce436c82b5c2107229c0417a3dc68126620641"
	EGIT_CHECKOUT_DIR="${S}"
fi

inherit golang-build
DESCRIPTION="CLI for Mottainai"
HOMEPAGE="https://mottainaici.github.com/"

LICENSE="GPL-3"
SLOT="0"
IUSE="lxd"
DEPEND="lxd? ( app-emulation/lxd )"
RDEPEND=""

src_compile() {
	use lxd && EGO_BUILD_FLAGS="-tags lxd"

	golang-build_src_compile
}

src_install() {
	dobin mottainai-cli
}
