class Grog < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.15.0"
  license "MIT"  # Update this to match your actual license

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.15.0/grog-darwin-arm64"
      sha256 "bc09afe843fa851593bfb201c6d0c5e9187c2a0305408b7e237159a0c6e140f9"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.15.0/grog-darwin-amd64"
      sha256 "2da057588a61fdd63d7f82b822e932d059387211ccd5d376c84754446d6db867"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.15.0/grog-linux-arm64"
      sha256 "c0686851b3f37f11c18155c00ac43ce371aa55edf229bee5de2fb129eaca030a"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.15.0/grog-linux-amd64"
      sha256 "b281a12506a719b61a23f312c00b318e4ebf90ad7427e3f0705e18afff7fb9ec"
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
