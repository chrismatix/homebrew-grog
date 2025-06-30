class Grog < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.11.2"
  license "MIT"  # Update this to match your actual license

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.11.2/grog-darwin-arm64"
      sha256 "eba5e72e5f0708bfc742af4a7d41048a9610d1ef85be81348446eda438ab940e"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.11.2/grog-darwin-amd64"
      sha256 "0125af6c8bf05263eaf79d174bd8dc1b1ea47a06292bba30c89fcda14c9d85a5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.11.2/grog-linux-arm64"
      sha256 "b1f6bb02bc04f45ca1283328124ac2088c80f9062e8485ac2e8374039ac60dc2"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.11.2/grog-linux-amd64"
      sha256 "4d1a84336027bb38313daaa8af045d103123f49f3c353fe1d1b3e9cf47915c7c"
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
