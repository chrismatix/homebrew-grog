class Grog < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.14.1"
  license "MIT"  # Update this to match your actual license

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.14.1/grog-darwin-arm64"
      sha256 "6be827423febf26ebbb485a27f3efe2e94e84bef9e110643c69faa12fa04d647"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.14.1/grog-darwin-amd64"
      sha256 "f8a3c941dfa6a3f0fd8a2fc9f152c06bb4b066e17b8ce2fddd9cfc407bd256b4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.14.1/grog-linux-arm64"
      sha256 "10d934719cb1a19bf00310d56c7ea7bb3e03b7faccf4be2e22796df5f9976459"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.14.1/grog-linux-amd64"
      sha256 "1231da9378f989a8b96143d29a7eb598c95c1ff1380ee1a0e50548d9416f6f7a"
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
