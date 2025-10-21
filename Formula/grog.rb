class Grog < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.16.3"
  license "MIT"  # Update this to match your actual license

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.16.3/grog-darwin-arm64"
      sha256 "cac7d749474127d54eb4bec46b8219c1192f3b7846ad3fa3f1bb58404aab7981"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.16.3/grog-darwin-amd64"
      sha256 "74dc1dbeb5e600721e9edd1fc855c020ba9c42fcbd3ace948be2a4829df5818b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.16.3/grog-linux-arm64"
      sha256 "87e013edce105fd8c9d46db3e1a6564282664ccc89d9dd61bd6237ca488d531c"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.16.3/grog-linux-amd64"
      sha256 "0e6886d9bd07b5bea1ca0ab47b39e6fb3c573372b415a9111af974246ddbbe2d"
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
