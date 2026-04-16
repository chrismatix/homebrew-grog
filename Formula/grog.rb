class Grog < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.35.0"
  license "MIT"  # Update this to match your actual license

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.35.0/grog-darwin-arm64"
      sha256 "029b1abca6032d090c7d975a73e37c15545649a9a1c7c5d8b8a9a45ff43f860e"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.35.0/grog-darwin-amd64"
      sha256 "c32c155e0d362f5ee35053b02e08af82aed566f2db2423efef9ff05b2e72b8ec"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.35.0/grog-linux-arm64"
      sha256 "94dfcdda0c8712f350784f8b4008bf5e2146e4fa49cc8831e526d1a24320c345"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.35.0/grog-linux-amd64"
      sha256 "bef66969fd24f536e655665c64638ce5c26bf3ec1d92d3e1d4cd96e7ec7b2681"
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
