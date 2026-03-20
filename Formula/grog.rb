class Grog < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.29.0"
  license "MIT"  # Update this to match your actual license

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.29.0/grog-darwin-arm64"
      sha256 "6d7dcf5fa90074c11264520eaa3718c24a76f267470882fe183a3b4d3d97a941"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.29.0/grog-darwin-amd64"
      sha256 "352d1e46607dc1cbaebfed4d2b4c71bbb029f00d72c7c908816a53d7037b4a65"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.29.0/grog-linux-arm64"
      sha256 "2e3bd1c79669d30ccedaaf6c1f355027bf4c4aaef9e9dce38642b29d683c2e60"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.29.0/grog-linux-amd64"
      sha256 "a331a79c889a02406fb86b48f0663a6719528c3563e0cda5ccab314c38a74956"
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
