class Velo < Formula
  desc "Blazing-fast terminal file manager written in Rust"
  homepage "https://github.com/quantumnic/velo"
  url "https://github.com/quantumnic/velo/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "ce9e1723a5e12088ee21d8e27e7f3e331f5c65dbe0f100a970d6c352ee5b7509"
  license "MIT"

  depends_on "pkgconf" => :build
  depends_on "rust" => :build
  depends_on "openssl@3"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    # velo is an interactive TUI without CLI flags; check the binary was installed
    assert_predicate bin/"velo", :executable?
  end
end
