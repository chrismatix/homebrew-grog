class Grog < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.23.1"
  license "MIT"  # Update this to match your actual license

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.23.1/grog-darwin-arm64"
      sha256 "983cb71e312179e1ba48e1df96e41b66eafa7a98173201d7f5fe1f91e8b9d6c7"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.23.1/grog-darwin-amd64"
      sha256 "f73038a1d6b4b5aa70f6fdb834ca6084b4d385124e684eecd387ff7affd3304d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.23.1/grog-linux-arm64"
      sha256 "2d261c62f849ddac6a3fc7d9d028d3d64e4173f1f46ea02a5d84e904dd8f9248"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.23.1/grog-linux-amd64"
      sha256 "90a3792a743e686e20e47c54b6e0faf9f16f6d05b7c8ce31d9f4662dc5b89a5f"
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
