class Grog < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.11.1"
  license "MIT"  # Update this to match your actual license

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.11.1/grog-darwin-arm64"
      sha256 "ad972c8fa61d96e8de92183b6a86fd5cdc9bff8c84a49e5a6a335a0ebcb3172a"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.11.1/grog-darwin-amd64"
      sha256 "71994d366fa913b95a9fc0126f5119848d1d6a590cd59700307822bb469e930c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.11.1/grog-linux-arm64"
      sha256 "da64375cf589feef34124051eb1e20d9a03a9b44254e73b9671af6c6a3f88c80"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.11.1/grog-linux-amd64"
      sha256 "5f324f83bf37a3d3d9b7022a42b4f1d50b79b59398f8745ead73b7f7310a45fc"
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
