class Grog < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.27.2"
  license "MIT"  # Update this to match your actual license

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.27.2/grog-darwin-arm64"
      sha256 "1c68ef76a25dffe6bf6f1410a3943a10befd54d44756ccaffb7bf7b1bfe541c7"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.27.2/grog-darwin-amd64"
      sha256 "939acd63f6a2dba68a52c07b41951e83911c451e19b0d8139d8f5968100adc89"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.27.2/grog-linux-arm64"
      sha256 "5ba4542963ff116db3afe5910ab3a0cebbce18771a14b375ccd5d2c3bbcf019c"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.27.2/grog-linux-amd64"
      sha256 "79a846b8a7f7929e7675b5092621de8971758b45cd65b0c6b5e5c44b07ff2614"
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
