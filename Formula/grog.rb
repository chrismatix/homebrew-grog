class Grog < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.28.0"
  license "MIT"  # Update this to match your actual license

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.28.0/grog-darwin-arm64"
      sha256 "897fd4e1cc66b0bdb26e86a2b842399579da5eaee55bbd6d26e1daae6b6ad344"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.28.0/grog-darwin-amd64"
      sha256 "15fe50d089b5464a938722fdc5ef42e8d8345ccd299de2b174826acf9fce2fbf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.28.0/grog-linux-arm64"
      sha256 "437f0a589c7629b9cc15dabaf169eb2fbf9db20f67ec502f67d1624f8f78f302"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.28.0/grog-linux-amd64"
      sha256 "10e335063e6da9d6173c7bd6d51985f34c51e6c72645d6aeabfcdb615b2281fb"
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
