class Grog < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.17.4"
  license "MIT"  # Update this to match your actual license

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.17.4/grog-darwin-arm64"
      sha256 "a1a26c3857952eb5dfa768601cb086f5a3c065f986595967df5ea6b396c9ffa3"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.17.4/grog-darwin-amd64"
      sha256 "18bbeb5edf0d0d0379b448f1f028d291ae0278a2816d6899608e9b6b7530c101"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.17.4/grog-linux-arm64"
      sha256 "b94c50354d020231e4f289b28dd948133add8e65e8945e2bdb0933dbf886b464"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.17.4/grog-linux-amd64"
      sha256 "630ed44e4cd118004f95845abe31a80fba4f8c4343d5c6b7911ebf419bb11efe"
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
