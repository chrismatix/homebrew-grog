class Grog < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.39.1"
  license "MIT"  # Update this to match your actual license

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.39.1/grog-darwin-arm64"
      sha256 "4bbf1f483e324537a6e1f2f8b76db5fc64962ef5146593e03438a407e28f8932"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.39.1/grog-darwin-amd64"
      sha256 "b5228738f0bcdef30db0ced859b71643c62086d810b55bc6907b74ee61d99951"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.39.1/grog-linux-arm64"
      sha256 "93a80d43fc6603f2237a127dd2b21b8bb4d31a4ad25e585e22c7b8eabf7e9ed3"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.39.1/grog-linux-amd64"
      sha256 "f95dec572e8c4cefa8549144cd74faad9b4dfc7b337ba3ca0dd6a37f31ae1142"
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
