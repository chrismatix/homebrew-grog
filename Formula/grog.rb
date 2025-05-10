class Grog < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.1.4"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/chrismatix/grog/releases/download/v0.1.4/grog-darwin-arm64"
    sha256 "8170b3610cce35bced77368b1ed4b3c12d715472db3a2bca77fd06fbf4955796"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/chrismatix/grog/releases/download/v0.1.4/grog-darwin-amd64"
    sha256 "7f8bbdf3ff1806407564ffc0d4fef4ead9bf875df94239e8e4ac6c83b1af17aa"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/chrismatix/grog/releases/download/v0.1.4/grog-linux-arm64"
    sha256 "de59f2e5d8ef16ea68f938bf17b78c9563c886afa43557a4b16b7009ff0bc7c1"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/chrismatix/grog/releases/download/v0.1.4/grog-linux-amd64"
    sha256 "a0338b9abd6dec831aec970ed88684f38fc8a04a6410ea897c36671a14dcae59"
  end

  def install
    bin.install Dir["grog-*"].first => "grog"
  end

  test do
    system "#{bin}/grog", "--version"
  end
end
