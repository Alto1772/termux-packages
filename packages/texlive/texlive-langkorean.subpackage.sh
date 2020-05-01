TERMUX_SUBPKG_DESCRIPTION="Texlive's collection-langkorean"
TERMUX_SUBPKG_DEPENDS="texlive-langjapanese, texlive-langcjk, texlive-latexrecommended"
TERMUX_SUBPKG_INCLUDE=$(python3 $TERMUX_PKG_BUILDER_DIR/parse_tlpdb.py langkorean $TERMUX_PKG_TMPDIR/texlive.tlpdb)
TERMUX_SUBPKG_CONFLICTS="texlive-bin (<< 20190410), texlive (<< 20190410)"

termux_step_create_subpkg_debscripts() {
	echo "#!$TERMUX_PREFIX/bin/sh" > postinst
	echo mktexlsr >> postinst
}
