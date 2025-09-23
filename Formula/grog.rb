class Grog < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.16.0"
  license "MIT"  # Update this to match your actual license

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.16.0/grog-darwin-arm64"
      sha256 "34a4b8c42f328f2431327fe3d42d318ce94733d2060be5dd2f6913732229e348"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.16.0/grog-darwin-amd64"
      sha256 "6a5d7a161b6e2cb20992740345b40d5688bcb9f9c495ab11c62cf1e3df451c71"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.16.0/grog-linux-arm64"
      sha256 "49b1d039fe0475e4818031c5d7f55b8dd14b61129a7fc39722e5277378f483fe"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.16.0/grog-linux-amd64"
      sha256 "9c9fa58c5147199e101373470ddf2edc05c643143db194619fee56565df28d43"
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
