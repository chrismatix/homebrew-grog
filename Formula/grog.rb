class Grog < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.50.0"
  license "MIT"
  conflicts_with "grog-full", because: "both install a grog binary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.50.0/grog-darwin-arm64"
      sha256 "b1922ddf6b713fec1b3d14f115d441c2b06d9e7819c56e0c7b7c68f7ab717083"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.50.0/grog-darwin-amd64"
      sha256 "3a75ae30f8ce09023076211630afbbc265b0623e839bf35f9700d38b5894bf30"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.50.0/grog-linux-arm64"
      sha256 "4a9a3721ac9f18beae6a4589a0a5b110a8a7c81efce05955b93a46420939d9f4"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.50.0/grog-linux-amd64"
      sha256 "52e12da18108bb32d6a4b3fb64136c05428bacc61c096eb79f3717bb83084161"
    end
  end

  def install
    bin.install Dir["grog-*"].first => "grog"
    chmod 0755, bin/"grog"
  end

  test do
    system "#{bin}/grog", "--version"
  end
end
