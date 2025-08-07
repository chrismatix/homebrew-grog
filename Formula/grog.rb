class Grog < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.14.0"
  license "MIT"  # Update this to match your actual license

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.14.0/grog-darwin-arm64"
      sha256 "18c09764beb57fe1f80ec0626dd9c103d1f4ef67dfbf4287f1f34ceb0040c2c4"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.14.0/grog-darwin-amd64"
      sha256 "a589fdb48db5b3963badd588885914f752ffaf15b2e1fe31a2264b5863961d39"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.14.0/grog-linux-arm64"
      sha256 "0a8214d2f8599682a36d12064065d12e3d1e2068f69d67f0b3afe393c5779f71"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.14.0/grog-linux-amd64"
      sha256 "7f919828cbdc5b9afd6f218ee0b0a865f32b0c79d3652dba5d80ad2ccc3dbebf"
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
