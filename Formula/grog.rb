class Grog < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.19.0"
  license "MIT"  # Update this to match your actual license

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.19.0/grog-darwin-arm64"
      sha256 "8f889d04bbd8ff9001106a6c591bf0eb3406bd963b1c7621c2980fbd36a5e086"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.19.0/grog-darwin-amd64"
      sha256 "a4997fd8c742ebc53b3aa07c72601621670218832becc84559129f156e4d4422"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.19.0/grog-linux-arm64"
      sha256 "85f581d212cd32cd10c85b75ca9ebdf29263efcf7cf3fc3811a337d3bacf6327"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.19.0/grog-linux-amd64"
      sha256 "da5c124c9a51cfc061865f66260f9e6831baf39697c0bd4694b0d2b33421fc9f"
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
