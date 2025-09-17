class Grog < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.14.3"
  license "MIT"  # Update this to match your actual license

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.14.3/grog-darwin-arm64"
      sha256 "6c691aafd32c8792e64f4ca2d59d6b6ae115ed26dc8dbe43b36ee142f18cd277"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.14.3/grog-darwin-amd64"
      sha256 "5d6a15255581c03dc545bfe8dea7b1e5c7ccc1e70b38342678cd0e92e9ab8253"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.14.3/grog-linux-arm64"
      sha256 "3141b30e8e24dca1870becf69fbbc59a9311570642fe8960a2d22fab7a452ece"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.14.3/grog-linux-amd64"
      sha256 "1b928e2ec0156861d1266c046ade5c7411806499cf25899a588931b9df6dd85c"
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
