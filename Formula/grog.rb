class Grog < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.14.4"
  license "MIT"  # Update this to match your actual license

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.14.4/grog-darwin-arm64"
      sha256 "f1a3f28ed46cd5f5a4dff135f6438b6cba395777a85b1f0db8c6f8d5b9e12b6d"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.14.4/grog-darwin-amd64"
      sha256 "875a6a16abc786976aa42ce1634efdc8432a87fa9598a680ece31d59b4f5d07b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.14.4/grog-linux-arm64"
      sha256 "295369efb1e1c96c94a80fe639fefcd9be7eb9debe20a738688a10eb77ba5ae6"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.14.4/grog-linux-amd64"
      sha256 "23a33e322fe40bbdb323913c243d4b5713db0d1efd20c42f3b30f574d57e513e"
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
