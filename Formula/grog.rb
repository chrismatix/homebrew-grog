class Grog < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.12.0"
  license "MIT"  # Update this to match your actual license

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.12.0/grog-darwin-arm64"
      sha256 "1bc272cb8f2980dce5e356537343399fc8dce903602f343ba1951fa645a84db4"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.12.0/grog-darwin-amd64"
      sha256 "5da5267dbb3811381f77eac6fe2f8d5a56da3f049a7eccd2282159d9ab3743b6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.12.0/grog-linux-arm64"
      sha256 "1a13480dc3fd599287abec19ec4f2541015ac311bc571a5906cc184b5ce52452"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.12.0/grog-linux-amd64"
      sha256 "7891f9b697cddeffb7a23e2e2806d32608c8e9896f85e2d6861410c90083bf77"
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
