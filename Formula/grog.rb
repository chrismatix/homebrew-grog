class Grog < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.10.0"
  license "MIT"  # Update this to match your actual license

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.10.0/grog-darwin-arm64"
      sha256 "b914a3b8926eae166ac2d86b9ca5dc339be732e6f5859fd2f386a2a8d5c25a97"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.10.0/grog-darwin-amd64"
      sha256 "46527894251f3144d6031c56803fdc9f07021b2a6c6a2089777f4ebbef7c9a54"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.10.0/grog-linux-arm64"
      sha256 "fcf6047c1e420605b30092c733cf1eb50f7314db8c0e7a30ef4e663e252f19ef"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.10.0/grog-linux-amd64"
      sha256 "f1baf4c5427f2f057492df9394b55d6f677913ec1cc27e4d89b87ec87f22e11b"
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
