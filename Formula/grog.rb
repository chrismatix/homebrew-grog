class Grog < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.17.0"
  license "MIT"  # Update this to match your actual license

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.17.0/grog-darwin-arm64"
      sha256 "71f7f8f53d6aa20813c4dd21ed91c289d1424974f16593d2fdedadeb12c1b78e"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.17.0/grog-darwin-amd64"
      sha256 "2513dd208bf5eaee19c13b95578c3452e6a1b8c80a3044d179912313468805fb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.17.0/grog-linux-arm64"
      sha256 "7a1b0f87ea3228f6d67e732d697ad61c903848b2424b8953a8435596744dc53f"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.17.0/grog-linux-amd64"
      sha256 "729c5ad3f148da2b910f5cdc913a2ca079511d0c73a2f5c49a1ae14d60e24996"
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
