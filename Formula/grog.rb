class Grog < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.9.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/chrismatix/grog/releases/download/v0.9.0/grog-darwin-arm64"
    sha256 "9bccd06fa1992411c344407f3af30a98326bddc8201ab4a5cc52bc4db03edb7e"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/chrismatix/grog/releases/download/v0.9.0/grog-darwin-amd64"
    sha256 "9a1a45c8fe620b5a3df8f38abbff223633f17edc45485a21187a5552aa6477c2"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/chrismatix/grog/releases/download/v0.9.0/grog-linux-arm64"
    sha256 "a4feb6e6130dcfeecd2dbd68bb617415caef65aa96ce9ef244806c9deebba867"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/chrismatix/grog/releases/download/v0.9.0/grog-linux-amd64"
    sha256 "ca8fec00228874a2eb25091733f311b9fa3227dd0be81c97bf3679ead0c52844"
  end

  def install
    bin.install Dir["grog-*"].first => "grog"
  end

  test do
    system "#{bin}/grog", "--version"
  end
end
