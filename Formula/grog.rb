class Grog < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.22.0"
  license "MIT"  # Update this to match your actual license

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.22.0/grog-darwin-arm64"
      sha256 "d6aa2e6592249a0df7703f1aa48439549003eb638048a23e6d5eed9def0ad3a0"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.22.0/grog-darwin-amd64"
      sha256 "b825177182d57426d24212d4d029c9e4ffbf98403e9702b6d7fdcb4cf569cd13"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.22.0/grog-linux-arm64"
      sha256 "f0777fb8c96f3f6d6a81731fadf0a5d25b3de71f9dbfca3304b4f81fb47dd52d"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.22.0/grog-linux-amd64"
      sha256 "bd865e12477c6b91aa6a39813a874c4963ef0e35678f93fde3cb8f34877755b6"
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
