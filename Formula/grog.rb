class Grog < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.14.2"
  license "MIT"  # Update this to match your actual license

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.14.2/grog-darwin-arm64"
      sha256 "8a03d634d44df30cc14f4aaf6d1759781c645c97bf7b713da0f27c4c04225c84"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.14.2/grog-darwin-amd64"
      sha256 "f5775eb7d9323d586cb6e1d1beac703329dd359fa10f4e4e28b92ac7b9dfbde7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.14.2/grog-linux-arm64"
      sha256 "ed6413326cd9ca8acdbba85002462ae6a763f94d00458e9f18fae2898bef5488"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.14.2/grog-linux-amd64"
      sha256 "0cd18f577d0e8e8272b3316d68def628fb28cc6ea4b10c3c58fa94ee4914a01d"
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
