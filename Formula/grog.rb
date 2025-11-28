class Grog < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.21.0"
  license "MIT"  # Update this to match your actual license

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.21.0/grog-darwin-arm64"
      sha256 "f044b6d95b0bf3f123e69477b9b5e5f4004ffded4f9758635693054d35d9e1e3"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.21.0/grog-darwin-amd64"
      sha256 "8e5dd911e7000c163d32d85dd953a8e2845f39c57214eaf6895dad61e5193910"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.21.0/grog-linux-arm64"
      sha256 "2f33290bf5d741488da9cea72221827a05ff56d7b9dfa0fd6d971484baedf232"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.21.0/grog-linux-amd64"
      sha256 "524d3c5e4a7d60588604101aa55f271369ef76b8f18677a5eab906e91f6d8487"
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
