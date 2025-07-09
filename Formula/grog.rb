class Grog < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.13.0"
  license "MIT"  # Update this to match your actual license

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.13.0/grog-darwin-arm64"
      sha256 "f8afe2fa8c8ef9e2914d75ca1ba3d19d2094a38171f0767386f1d588d36c2a19"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.13.0/grog-darwin-amd64"
      sha256 "18a99b0680906ed4b66eafdd3bd8e7c2d28eede9a930095521172eb1a9eff9d6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.13.0/grog-linux-arm64"
      sha256 "02df6876f5159101aa1d31ac59a02397aced82f9d300971298ea81936b98dacf"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.13.0/grog-linux-amd64"
      sha256 "78fcbac9655c986326d3ef2f1d3ab296b5a175015e05a16b1e846490b680f3bd"
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
