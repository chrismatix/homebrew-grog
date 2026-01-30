class Grog < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.24.0"
  license "MIT"  # Update this to match your actual license

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.24.0/grog-darwin-arm64"
      sha256 "95276b305f75d94924418e06ddafd0e844ae4c9bca597ba5996ba895fdd09e0f"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.24.0/grog-darwin-amd64"
      sha256 "63358b462d479cf8e21a1bcc39f1c03b3877fc7b9e530c5945770c84a3cddac2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.24.0/grog-linux-arm64"
      sha256 "ffd7055ff784b96759f154e7fc1f4217fa149a802a6aa28313d87346bba826bf"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.24.0/grog-linux-amd64"
      sha256 "b838a6a439590a9922cd8e2ba8095d801d62a64581971ca62d408bbb6a66a0af"
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
