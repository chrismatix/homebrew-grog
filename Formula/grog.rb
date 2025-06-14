class Grog < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.9.5"
  license "MIT"  # Update this to match your actual license

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.9.5/grog-darwin-arm64"
      sha256 "7897c0bd1c1c6473821fb564fb3ec710e7edf95376b55141e1136e00cf896835"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.9.5/grog-darwin-amd64"
      sha256 "616bb5e2e37b733e2ec2dfcd4d85c69ccd4a250188f0d05438dc7fc76d15cc43"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.9.5/grog-linux-arm64"
      sha256 "8f28fb16353f0a8e3dca219a8064a17ec21d8f547bd9bd5da9ac547a17214936"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.9.5/grog-linux-amd64"
      sha256 "0e86a4c51a5d51ec3463a285063a1c53ac6c71a9ac06bf9629e5b4be0e9e5e4b"
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
