class Grog < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.23.4"
  license "MIT"  # Update this to match your actual license

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.23.4/grog-darwin-arm64"
      sha256 "cd0f19a606dee3da6fb001ea091ec2a922048e3aa2e8c00aa99c93972cf4a48e"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.23.4/grog-darwin-amd64"
      sha256 "d1da24ef89c1b5705a2aa4d42c526b885e79cfb3e22318324b0a979be5c5623c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.23.4/grog-linux-arm64"
      sha256 "24ef19b70df77848fad976b9af60530fed699aa93b095d2b89fead7a5c0e7bfe"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.23.4/grog-linux-amd64"
      sha256 "e7eeff80ba189542f033833817db2228f5bf0691009532cec1b07a9c3eefa66d"
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
