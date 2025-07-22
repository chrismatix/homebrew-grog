class Grog < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.13.1"
  license "MIT"  # Update this to match your actual license

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.13.1/grog-darwin-arm64"
      sha256 "8b8c7e6915f36404bfbbc5533aa57da9a4d6fd020c89d22f9b1577828710ae3d"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.13.1/grog-darwin-amd64"
      sha256 "99ef58b76d7e03301c0ad289929bdfe1090342d79440034f713dec2572ae3af0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.13.1/grog-linux-arm64"
      sha256 "2250542f3b83eac79ca192b5a18238b4aaebac51bdb65fa176c0f3453de869ce"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.13.1/grog-linux-amd64"
      sha256 "abd114e00d1af990ad0e320a5f04ae21df6744c625e07f9cad70e6e03c3dd306"
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
