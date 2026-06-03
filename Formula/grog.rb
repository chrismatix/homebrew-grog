class Grog < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.42.0"
  license "MIT"  # Update this to match your actual license

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.42.0/grog-darwin-arm64"
      sha256 "71ba223eb502a9222b62bbc7ef79ae05af084be70fd5104463c7b4529bbc0940"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.42.0/grog-darwin-amd64"
      sha256 "dfb9c3b9e3ebd128376fa7bc83340cf701772d03bb203866034122d9b11d61da"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.42.0/grog-linux-arm64"
      sha256 "f5ae2e4004dc816dede2392205f681d81c942fe8965255277f545f7ec9327ce2"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.42.0/grog-linux-amd64"
      sha256 "d6f45831cbbaba608f8a3caf6c3d3abbb7720f3dea336f297e8df0d72f15eb13"
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
