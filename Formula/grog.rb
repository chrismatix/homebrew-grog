class Grog < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.47.0"
  license "MIT"  # Update this to match your actual license

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.47.0/grog-darwin-arm64"
      sha256 "14816002fe778b127012ebb12c6e049756efeba05e99c1f59b20c7530b60b466"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.47.0/grog-darwin-amd64"
      sha256 "bd4aaa12c7cba5ab5664a58e6c2adae980dec0e4152d558dbcc9bffd8d39df1f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.47.0/grog-linux-arm64"
      sha256 "c63fecc87e5224c74d4f1ed9dba788a6d4ba337a71859a43a7552daf87096f76"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.47.0/grog-linux-amd64"
      sha256 "957052aac9e57eb88170f2c56e34b5ee7fb88ea776f0bfffeefff0067cc10fdc"
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
