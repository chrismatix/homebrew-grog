class Grog < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.17.1"
  license "MIT"  # Update this to match your actual license

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.17.1/grog-darwin-arm64"
      sha256 "538c7104a839ec16716373389a46838af52b269cefb2fefee8eb2643cf0a0736"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.17.1/grog-darwin-amd64"
      sha256 "c41bc16abc03971fc701746b53b12a4a3b548c74a721123424d42e6c5750fb96"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.17.1/grog-linux-arm64"
      sha256 "9bb919e49d37d04a01b9e53acd64e71e8820fef559b0a3d2d54bf3f8c84a8995"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.17.1/grog-linux-amd64"
      sha256 "8689ca32f1df8fa3edb502c8133a82c24e52dd7adcb3c4bf491c39ad2dd999e9"
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
