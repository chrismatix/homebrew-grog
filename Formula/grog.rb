class Grog < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.40.0"
  license "MIT"  # Update this to match your actual license

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.40.0/grog-darwin-arm64"
      sha256 "10ceae8ca1db9685b3cd4a4905753fc46f7763c167a704b176ef679b5e7ad3b1"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.40.0/grog-darwin-amd64"
      sha256 "edf09009119d420750ef49a1bdd7c3bb0c3d8ba3d6c31d02e4f2eec3e2a2d92c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.40.0/grog-linux-arm64"
      sha256 "8e5242ac22e20b83a420cb33ba76ac7f317f11a98b7423420971a0082d80c779"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.40.0/grog-linux-amd64"
      sha256 "d7d448b4d1746728f29788b0e2b871d95c2f87b95b70929595d1f8095fa6404f"
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
