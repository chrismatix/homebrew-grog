class Grog < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.9.4"
  license "MIT"  # Update this to match your actual license

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.9.4/grog-darwin-arm64"
      sha256 "f522e0bc982fbb3fd0f4ebffc0d1bce71369a6bb989b5ba197dd41e4dd5af264"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.9.4/grog-darwin-amd64"
      sha256 "4b850b7f24035c91fe2f1ffb66d3589d1ee4821c7a2f295a48636898e125557a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.9.4/grog-linux-arm64"
      sha256 "ab74e4acd7e2ee9b94751a0dbf91f401a982d6b90480ba1130f89dbf3e612c4d"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.9.4/grog-linux-amd64"
      sha256 "ce9633151fdb899b8dda4ee70691d18a40cc517901a4cf9963d701e88c8fe675"
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
