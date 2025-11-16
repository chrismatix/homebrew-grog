class Grog < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.18.0"
  license "MIT"  # Update this to match your actual license

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.18.0/grog-darwin-arm64"
      sha256 "0bea7e00cc693a6ac9c8148a4e2c60774002942c13e2969fc2121d94ef7f303a"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.18.0/grog-darwin-amd64"
      sha256 "374ec4cea994cc0a23c38cdd54e36c850951942b75ff2bc1be1f16b12e3ff6c2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.18.0/grog-linux-arm64"
      sha256 "43fdeb5450cf5c9fdc2c1d8b939b00ea4d3684887ca63c9cba1ecb8186fad9a1"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.18.0/grog-linux-amd64"
      sha256 "cf139b3188e0e90a142111ee36190efbf0fc61ff0e9885d440b22b816bbd28b7"
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
