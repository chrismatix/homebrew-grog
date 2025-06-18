class Grog < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.11.0"
  license "MIT"  # Update this to match your actual license

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.11.0/grog-darwin-arm64"
      sha256 "9f7235850cbc09191229c37bd12a408242037627a60e75d1036e6213e1aa387f"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.11.0/grog-darwin-amd64"
      sha256 "cf4263e9cad81ea21745844d544d75bed6a2d3cbe2637a9f2e118ce9f0b64c74"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.11.0/grog-linux-arm64"
      sha256 "6cd85abc0933e82df49c7fc858fcb66d8d01038b0ef5fce5d007ab8b599a6911"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.11.0/grog-linux-amd64"
      sha256 "efbcabbabcd27d7e34708da89a6c77f256085e8e7c0482bea9ec03708447e65e"
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
