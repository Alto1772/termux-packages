TERMUX_PKG_HOMEPAGE=https://dns.lookup.dog/
TERMUX_PKG_DESCRIPTION="A command-line DNS client"
TERMUX_PKG_LICENSE="EUPL-1.2"
TERMUX_PKG_LICENSE_FILE="LICENCE"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=0.1.0
TERMUX_PKG_REVISION=2.1
TERMUX_PKG_SRCURL=https://github.com/ogham/dog/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=82387d38727bac7fcdb080970e84b36de80bfe7923ce83f993a77d9ac7847858
TERMUX_PKG_DEPENDS="openssl-1.1, resolv-conf"
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_pre_configure() {
	export OPENSSL_INCLUDE_DIR=$TERMUX_PREFIX/opt/openssl1.1/include
	export OPENSSL_LIB_DIR=$TERMUX_PREFIX/opt/openssl1.1/lib
	CFLAGS="-I$TERMUX_PREFIX/opt/openssl1.1/include $CFLAGS"
	CPPFLAGS="-I$TERMUX_PREFIX/opt/openssl1.1/include $CPPFLAGS"
	CXXFLAGS="-I$TERMUX_PREFIX/opt/openssl1.1/include $CXXFLAGS"
	LDFLAGS="-L$TERMUX_PREFIX/opt/openssl1.1/lib -Wl,-rpath=$TERMUX_PREFIX/opt/openssl1.1/lib $LDFLAGS"
	
	RUSTFLAGS+=" -C link-arg=-Wl,-rpath=$TERMUX_PREFIX/opt/openssl1.1/lib"
}
