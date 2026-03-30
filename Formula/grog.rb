class Grog < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.31.0"
  license "MIT"  # Update this to match your actual license

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.31.0/grog-darwin-arm64"
      sha256 "2f20c35821735bb5ea8204321b8e93b1db8bd7ee1c83ae996ddf809eb06b9ec9"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.31.0/grog-darwin-amd64"
      sha256 "5b1a4d5e07df3501d250a950ffb7d97d386b90372a8be68acc53ca057294ce9a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/chrismatix/grog/releases/download/v0.31.0/grog-linux-arm64"
      sha256 "7a6b45d44f0069c5cfc3634fdf0a43edb1b7cb544053563170d93edc0e4b8674"
    else
      url "https://github.com/chrismatix/grog/releases/download/v0.31.0/grog-linux-amd64"
      sha256 "9cc56358c3adb6587859c2e1aae1fb2d2a8743dd3764a55f8af68dfb11893ab6"
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
