class Grog < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.2.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/chrismatix/grog/releases/download/v0.2.1/grog-darwin-arm64"
    sha256 "821ea68dfdd3d938d519931b261ea145f21b45b49acc2e0c93a97be1e894bf5b"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/chrismatix/grog/releases/download/v0.2.1/grog-darwin-amd64"
    sha256 "ce8fecce99223fd02ca32284c06deb3af75a42477deadec4df80bfa3a83d92e8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/chrismatix/grog/releases/download/v0.2.1/grog-linux-arm64"
    sha256 "772d74682653faef9411a478232e68c0eb5e618338c1056b67b01efc78381447"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/chrismatix/grog/releases/download/v0.2.1/grog-linux-amd64"
    sha256 "08f0f3a7a759ee30111df1bf66c042b6f300b01d7b8e9a696754f2915468dafb"
  end

  def install
    bin.install Dir["grog-*"].first => "grog"
  end

  test do
    system "#{bin}/grog", "--version"
  end
end
