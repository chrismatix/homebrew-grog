class Grog < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.23.2"
  license "MIT"  # Update this to match your actual license

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.23.2/grog-darwin-arm64"
      sha256 "b2b499107dbf6b07479da45c3c513d46dfa048857d6c3c05cef50acd4c3db00e"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.23.2/grog-darwin-amd64"
      sha256 "965dcbb25907d9ce47190e81b62ee71f041412247d4d83fbfa54c6e9a8c52550"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.23.2/grog-linux-arm64"
      sha256 "93b7df444a4fff0be554de839bf263dbb566ba071014aaf8e9fcce7919d1136f"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.23.2/grog-linux-amd64"
      sha256 "a05bd6222ca8cbecd81e860086ed2e9934feea780452f41d4f537f82dd303f5a"
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
