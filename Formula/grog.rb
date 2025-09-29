class Grog < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.16.2"
  license "MIT"  # Update this to match your actual license

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.16.2/grog-darwin-arm64"
      sha256 "f70ca49b683b3c5e62be6d9a2947aec1fd2d12234c32816e355c6a282865aceb"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.16.2/grog-darwin-amd64"
      sha256 "5dfa0c88d13e49cb9e0b15f55e1422dcfe253609eb6352a1001c20aff7cda4a0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.16.2/grog-linux-arm64"
      sha256 "c02b2401a0b0a40fb1acb7dcf3410edb7d1780555b7724c5315c4209b7a907eb"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.16.2/grog-linux-amd64"
      sha256 "b7a8a7bae604b03a76aa5e292daaf58763924ca13d00d06174dffdb8c3acd8d4"
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
