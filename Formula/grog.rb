class Grog < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.20.0"
  license "MIT"  # Update this to match your actual license

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.20.0/grog-darwin-arm64"
      sha256 "891f71d00b651b7f35dbfec82ead5fbe0e78ed97285ce3bead86856612a520c6"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.20.0/grog-darwin-amd64"
      sha256 "6d7503fac33aac04366601b86ec6da258e92bb7ce935a520bb7777a5738b0b6f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.20.0/grog-linux-arm64"
      sha256 "e6fc42a0328c26876f7e967f4a0503da354a5d81c0958b8ade5e6cd4d7c546c0"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.20.0/grog-linux-amd64"
      sha256 "af45ca8e27e37c40569f4792541c634fad0451651dbad7bd1517cf46adba5067"
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
