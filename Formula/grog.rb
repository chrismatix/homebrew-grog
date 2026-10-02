class Grog < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.48.0"
  license "MIT"  # Update this to match your actual license

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.48.0/grog-darwin-arm64"
      sha256 "6f8b4b1aa5efac3ea1b5341580f2b8669f5e94e438e5502c6ca77301af743ea8"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.48.0/grog-darwin-amd64"
      sha256 "16cacffdb746577cc709bf9b387deb66cc711fd71caaa68fd275da2898e5b008"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.48.0/grog-linux-arm64"
      sha256 "5c793b93715c266f278595161e02dd5700aa5b8d59afc84a701b4b486173aa01"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.48.0/grog-linux-amd64"
      sha256 "2b34c1768aa20e8efef9ce9b3e4f1e3932ec7eaf3c970a7432a651126417ec7f"
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
