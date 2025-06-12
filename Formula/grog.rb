class Grog < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.9.3"
  license "MIT"  # Update this to match your actual license

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.9.3/grog-darwin-arm64"
      sha256 "af2678c5724102326ded78b9a1aa25ea25082a17186df02f8fb6ab6b61f1962a"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.9.3/grog-darwin-amd64"
      sha256 "e7633a4706b21417360a780ed5fb677b16886dded222f7931314a2cf988bb35f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.9.3/grog-linux-arm64"
      sha256 "5afa998b5be5e513871204f9c503e14a0bcbe1f55289f48d083c83b71e07652c"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.9.3/grog-linux-amd64"
      sha256 "3e9e35fbe21281fc310ee75be72200bcc8dd6aed4f73d79a6712a91f9e1665e5"
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
