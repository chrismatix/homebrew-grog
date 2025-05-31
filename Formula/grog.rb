class Grog < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.5.3"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/chrismatix/grog/releases/download/v0.5.3/grog-darwin-arm64"
    sha256 "0132fd36631dbc9d7523b82ea25880dcde5229d799cc4ef3bcd76244e5f007f3"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/chrismatix/grog/releases/download/v0.5.3/grog-darwin-amd64"
    sha256 "6f8ea96181ffdd35820d889ebc11a898f2a6bfe8e51b1003a134fa0bde77bd3f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/chrismatix/grog/releases/download/v0.5.3/grog-linux-arm64"
    sha256 "0dd997d9183282b9ced13e8b471c4b4542ea09b22916fb4c0a29b50b98d14067"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/chrismatix/grog/releases/download/v0.5.3/grog-linux-amd64"
    sha256 "43b119bd496d1675d44bcc3dd1e4539de3b2f0208adeed013503423d96693cf0"
  end

  def install
    bin.install Dir["grog-*"].first => "grog"
  end

  test do
    system "#{bin}/grog", "--version"
  end
end
