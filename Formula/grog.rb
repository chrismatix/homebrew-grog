class Grog < Formula
  desc "Grog build system CLI"
  homepage "https://github.com/chrismatix/grog"
  version "v0.7.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/chrismatix/grog/releases/download/v0.7.0/grog-darwin-arm64"
    sha256 "26013fdcb96fdbd13eff04a11cc9bacd1a10acc1a480fcf0d5d9626cd1e02191"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/chrismatix/grog/releases/download/v0.7.0/grog-darwin-amd64"
    sha256 "7ce40533e6f0535c62a93b31ac0f0fc1b63eb2c2e7b4ea316718a1fa16f57f67"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/chrismatix/grog/releases/download/v0.7.0/grog-linux-arm64"
    sha256 "22899a1fba68def339af8e38cc4a84644f77c392c190251b7b6cc3eab10720af"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/chrismatix/grog/releases/download/v0.7.0/grog-linux-amd64"
    sha256 "cfac879a63eb806ecb290f7f8be10513e9650227bb5f73288c3b4fc355cc951f"
  end

  def install
    bin.install Dir["grog-*"].first => "grog"
  end

  test do
    system "#{bin}/grog", "--version"
  end
end
