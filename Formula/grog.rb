class Grog < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.9.1"
  license "MIT"  # Update this to match your actual license

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.9.1/grog-darwin-arm64"
      sha256 "0db67a4a262fc4ec091c976a97cbb07d039e6bf07862bf0ef5581f44ef7b1959"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.9.1/grog-darwin-amd64"
      sha256 "ad04bf81e21f2a1b3809bde7eb49a607a0bcce6e6607bf50e314540e34f01db7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.9.1/grog-linux-arm64"
      sha256 "dd86e684bcaeadf55fcab97e67abd5eaac89fcf7d7b9a62fdd5003347b500ddf"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.9.1/grog-linux-amd64"
      sha256 "6d0c544caca0378c03d9331ee29c1d5501081fbbe67ea582812601ab5665359a"
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
