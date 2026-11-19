class GrogFull < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.50.0"
  license "MIT"
  conflicts_with "grog", because: "both install a grog binary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.50.0/grog-full-darwin-arm64"
      sha256 "5c957d45cd6e980cae0074508db3b2ee64475765684aedbb1c20148050690bed"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.50.0/grog-full-darwin-amd64"
      sha256 "44500abcd1ad856d227afe873ef968b911303705ca219d36eecb4a350b0045cd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.50.0/grog-full-linux-arm64"
      sha256 "7e59ddb0a93c921f5f5fb7b2507a86c6882bcc2f37ee6c814eb8a3c9558d88ea"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.50.0/grog-full-linux-amd64"
      sha256 "994aa4759df8ca068494d1b6d065ea65d9efbab5d22201e4a115479b8ef6c498"
    end
  end

  def install
    bin.install Dir["grog-full-*"].first => "grog"
    chmod 0755, bin/"grog"
  end

  test do
    system "#{bin}/grog", "--version"
  end
end
