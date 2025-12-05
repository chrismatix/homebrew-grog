class Grog < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.23.0"
  license "MIT"  # Update this to match your actual license

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.23.0/grog-darwin-arm64"
      sha256 "ad21814755ee951003acf4a3cf7d71766f846201f23b6f9433c7d8f3b1abdc61"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.23.0/grog-darwin-amd64"
      sha256 "3ae2624175c304ab44b6f7d94cf038cdd1c267a8094ad2f112eb420fe998d349"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.23.0/grog-linux-arm64"
      sha256 "73065aaa09ddc75a7635ba4bf2666e6962ed77c55f2225e12e7d33f67e147990"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.23.0/grog-linux-amd64"
      sha256 "02a5bc3542fcf2f9b837d611c3d36e3c78cd10d6ba2358c4fc6461a82263df6e"
    end
  end

  def install
    # The downloaded file will have the platform-specific name, so we rename it
    binary_name = Dir["grog-*"].first
    bin.install binary_name => "grog"

    # Make sure it's executable
    chmod 0755, bin/"grog"
  end

  test do
    system "#{bin}/grog", "--version"
  end
end
