class Grog < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.9.2"
  license "MIT"  # Update this to match your actual license

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.9.2/grog-darwin-arm64"
      sha256 "88fc6c2317189251fb0ac21a3d2a2a20ba9c34e2572bfaa683d3729dd0164de6"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.9.2/grog-darwin-amd64"
      sha256 "ce005eb113976a9c3b5ca586f8516b91c81ef90f0c46d678a55b5557d8fb835c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.9.2/grog-linux-arm64"
      sha256 "5ad7d1b3e9dbda0557b752d928065272b367c0dfe1b1f90603a05b453b7dcb70"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.9.2/grog-linux-amd64"
      sha256 "fbb1a1bd9fe8be710f074eae301419dee80f35cea2860500c0d4ae682fafbc1b"
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
