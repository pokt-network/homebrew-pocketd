class Pocketd < Formula
  desc "Pocket - A CLI tool for managing your Pocket Network nodes"
  homepage "https://github.com/pokt-network/poktroll"
  url "https://github.com/pokt-network/poktroll/archive/refs/tags/v0.1.31.tar.gz"
  sha256 "f2add1ba63619d1780edc4145dbf0380a57717ba99a3ebb1a224de1a8008af3c"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_intel do  # on_macos_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.31/pocket_darwin_amd64.tar.gz"
      sha256 "49201ef60780fa1114835a9c239fe9b54076e64cb5fa703c4827fc8aa694569b"
    end

    on_arm do # on_macos_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.31/pocket_darwin_arm64.tar.gz"
      sha256 "23a2b3b9893ab8aee325f241cb815fb0a751164fb4fd78e965910f385b261b19"
    end
  end

  on_linux do
    on_intel do # on_linux_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.31/pocket_linux_amd64.tar.gz"
      sha256 "a7eb05ad54346d50c4d6ee18c48875b4e679c3d39f5ee274a091730cb069e795"
    end

    on_arm do # on_linux_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.31/pocket_linux_arm64.tar.gz"
      sha256 "d73db0b03a9cae139bab908505c2e810517a62981a1ce5c923e68d4ac1ba45fb"
    end
  end

  def install
    # Ensure that the binary name matches the extracted file
    bin.install "pocketd"
  end

  test do
    # Replace with an actual test command
    system "#{bin}/pocketd", "version"
  end
end