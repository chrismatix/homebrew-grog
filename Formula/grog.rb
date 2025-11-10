class Grog < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.17.4"
  license "MIT"  # Update this to match your actual license

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.17.4/grog-darwin-arm64"
      sha256 "3dcfccc8ef5551860ca606b33938a3b82c306666ecee6d3ad200b606901e5e2a"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.17.4/grog-darwin-amd64"
      sha256 "104352804624ecc62ae5c069f3953e91f7b1e36db1e1e21c56adb770df22b861"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.17.4/grog-linux-arm64"
      sha256 "ea544fcd1fd7326d238c15894ad39cfd1ee0d634b0f162eacc11d3315eaabe91"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.17.4/grog-linux-amd64"
      sha256 "38dc3651a0e9ea4ec12361a3ceb0cc4d2ce7beff09af22252c6065228553c983"
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
