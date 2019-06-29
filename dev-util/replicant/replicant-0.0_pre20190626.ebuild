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
	EGIT_COMMIT="752e004fcdbd26461336bf711ad1c3e9d2d572e3"
	EGIT_CHECKOUT_DIR="${S}"
	EGIT_BRANCH="develop"
fi

inherit golang-build
DESCRIPTION="Infrastructure repository controller for Mottainai"
HOMEPAGE="https://mottainaici.github.com/"

LICENSE="GPL-3"
SLOT="0"
IUSE=""
RDEPEND="dev-vcs/git"
DEPEND="${RDEPEND}"

src_install() {
	dobin replicant
}