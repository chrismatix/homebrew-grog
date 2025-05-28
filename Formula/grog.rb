class Grog < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.5.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/chrismatix/grog/releases/download/v0.5.1/grog-darwin-arm64"
    sha256 "3b6a734e857cc932ade2751a389bc60fca173bd4e4d15e5e75667308b9d59cbe"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/chrismatix/grog/releases/download/v0.5.1/grog-darwin-amd64"
    sha256 "68d614d112c123f79aed2c76568838b10a63edae46a044021c82bc8c1b0103ff"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/chrismatix/grog/releases/download/v0.5.1/grog-linux-arm64"
    sha256 "13e9200fd38b46a0c001e46c86ac285d8a4616687d943072fe7148cc055bdf68"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/chrismatix/grog/releases/download/v0.5.1/grog-linux-amd64"
    sha256 "ab7c518a12a84d94faba19bd51b11ee4136b3bda442767ab1ed4a924cf3585c4"
  end

  def install
    bin.install Dir["grog-*"].first => "grog"
  end

  test do
    system "#{bin}/grog", "--version"
  end
end
