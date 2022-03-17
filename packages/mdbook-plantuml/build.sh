TERMUX_PKG_HOMEPAGE=https://github.com/sytsereitsma/mdbook-plantuml
TERMUX_PKG_DESCRIPTION="mdBook preprocessor to render PlantUML code blocks as images in your book"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=0.7.0
TERMUX_PKG_REVISION=1.1
TERMUX_PKG_SRCURL=https://github.com/sytsereitsma/mdbook-plantuml.git
TERMUX_PKG_DEPENDS="openssl-1.1"
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

termux_step_make() {
	termux_setup_rust
	cargo build --jobs $TERMUX_MAKE_PROCESSES --target $CARGO_TARGET_NAME --release
}

termux_step_make_install() {
	install -Dm700 -t $TERMUX_PREFIX/bin target/${CARGO_TARGET_NAME}/release/mdbook-plantuml
}
