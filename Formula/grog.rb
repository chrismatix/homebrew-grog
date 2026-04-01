class Grog < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.32.0"
  license "MIT"  # Update this to match your actual license

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.32.0/grog-darwin-arm64"
      sha256 "6e25ab4b9a34c92cc577566b99f8d58ed204d4c040def846c13d4facb65de8db"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.32.0/grog-darwin-amd64"
      sha256 "6c12bd5394f598b723207786e2292d1a972d87e24a1b8624e2548e8e25fb46a2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.32.0/grog-linux-arm64"
      sha256 "2606cd7882d30b0d05d151848cc7b26b63806e938600f03789725d9633b0432e"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.32.0/grog-linux-amd64"
      sha256 "66fc2a59fbb4b73d791565893644517fb6a094b5127f03846d5ec841bc0894cf"
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
