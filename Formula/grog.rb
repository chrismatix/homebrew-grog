class Grog < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.25.0"
  license "MIT"  # Update this to match your actual license

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.25.0/grog-darwin-arm64"
      sha256 "2265778123c2db95ffbfbd7660da20e7c44e01e8da353332a1cb8f509f22af29"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.25.0/grog-darwin-amd64"
      sha256 "a054ebc8107b07b7715b53c1813213dd9f9235b7670622445e7a37312f8ddb51"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.25.0/grog-linux-arm64"
      sha256 "0b83d3d59697acce71f569881616bfe4bdd4c813c305eb7e328200da0962b10f"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.25.0/grog-linux-amd64"
      sha256 "2814dd2caf3ab959d5832a449cd8950a230f4984f40d32b2aba0c2313c4e4260"
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
