class Grog < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.36.1"
  license "MIT"  # Update this to match your actual license

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.36.1/grog-darwin-arm64"
      sha256 "0ba1ea22462d70f2da7f396df53ecac06baa1604cc130fc26f3ff936ebdba6aa"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.36.1/grog-darwin-amd64"
      sha256 "55c8c19d3c05ceef6a77e27a012c5be343012c9ecc5a0178d21b7c2bc8442bc2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.36.1/grog-linux-arm64"
      sha256 "ba3bb9991dc125f2839b4a542b9baf6745696dfee5439f8100b57e19752f91af"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.36.1/grog-linux-amd64"
      sha256 "076e97bc6c9e7ad39a14abb64d87a93928596c82e16207b6e6879e76c9f75bd3"
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
