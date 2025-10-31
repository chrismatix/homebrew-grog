class Grog < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.17.2"
  license "MIT"  # Update this to match your actual license

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.17.2/grog-darwin-arm64"
      sha256 "f6814a09ec59374f46e5902ff838ccd99a3c5653cd7310df045d1f36b886e1f6"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.17.2/grog-darwin-amd64"
      sha256 "1cc83ff9ac6c9473c11805cafb177550aa98c1ab81f315529caa8b3420ce50c4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.17.2/grog-linux-arm64"
      sha256 "2f4b3c62d086a94ed745bc1cd8d558de6dc6fce8884b56c9f636210451c38bd6"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.17.2/grog-linux-amd64"
      sha256 "ef1c6bb234fdc525eb6711f19488db805e0d2736a1ab21c50a1bbe17816d674f"
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
