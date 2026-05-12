class Grog < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.37.0"
  license "MIT"  # Update this to match your actual license

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.37.0/grog-darwin-arm64"
      sha256 "1b65d869b0c89cce4c90e65aa2439270255543fc150c13194437300b19ff8131"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.37.0/grog-darwin-amd64"
      sha256 "618d0a3cf5843e911b5e51313400ddc906dce6851c0bfc89e460b4d68d15ed6f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.37.0/grog-linux-arm64"
      sha256 "f0ba6c53418401f18965617b3d82adb8a62566f2f3fb94fd913590c789f0e773"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.37.0/grog-linux-amd64"
      sha256 "0e1ddb21067ce2401b6a10df7e94b93500f219d849cf062a15ceae2c1a998980"
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
