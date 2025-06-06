class Grog < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.8.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/chrismatix/grog/releases/download/v0.8.0/grog-darwin-arm64"
    sha256 "a01e73eabbf5b696c4c4144408afb6e565be791855b6d8844df9b5757cf0e9ea"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/chrismatix/grog/releases/download/v0.8.0/grog-darwin-amd64"
    sha256 "0626bd514d15540efa52491bce1ed6084cf0c4ad2505bca0fbbb219245c80812"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/chrismatix/grog/releases/download/v0.8.0/grog-linux-arm64"
    sha256 "59b2460eff230d5be45fd8121494cb5631e0653bb0e2e2d669ebb12f830efddc"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/chrismatix/grog/releases/download/v0.8.0/grog-linux-amd64"
    sha256 "df7b075d0202c21dca4bdf7ca1f55376c4c7378d2807430d3d1386dbfe365159"
  end

  def install
    bin.install Dir["grog-*"].first => "grog"
  end

  test do
    system "#{bin}/grog", "--version"
  end
end
