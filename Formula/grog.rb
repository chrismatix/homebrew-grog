class Grog < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.36.6"
  license "MIT"  # Update this to match your actual license

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.36.6/grog-darwin-arm64"
      sha256 "b5a233e7af8c937d00383897fc19e7df7a4f4393225e708ad03c24c2acf49183"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.36.6/grog-darwin-amd64"
      sha256 "8eff059a3d1b2aa27f8dfa4d95152a5279fbe7935685293369719061029022f3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.36.6/grog-linux-arm64"
      sha256 "13ebb004f4f8cd94923f244070b66de713262f31226ec55b13791fd72dea52f9"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.36.6/grog-linux-amd64"
      sha256 "d0446819cdafa76f71741f6017e3d056262e2c4abf968678cbe77d29822c6392"
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
