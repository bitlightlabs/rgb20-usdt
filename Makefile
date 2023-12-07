.PHONY: all check clean

all: build

check: fmt test clippy

test:
	cargo test --all-features

fmt:
	cargo fmt --all -- --check

clippy:
	cargo clippy --workspace --all-targets --tests -- -D warnings

clean:
	cargo clean

build:
	cargo build --release

build-linux-server-release:
	rustup target add x86_64-unknown-linux-gnu
	cargo build --release --target x86_64-unknown-linux-gnu
	#rustup target add aarch64-unknown-linux-gnu
	#cargo build --release --target aarch64-unknown-linux-gnu

build-linux-server:
	rustup target add x86_64-unknown-linux-gnu
	cargo build  --target x86_64-unknown-linux-gnu
	#rustup target add aarch64-unknown-linux-gnu
	#cargo build  --target aarch64-unknown-linux-gnu

build-ios:
	rustup target add aarch64-apple-ios
	cargo build --release --target aarch64-apple-ios