class Pocketd < Formula
  desc "Pocket - A CLI tool for managing your Pocket Network nodes"
  homepage "https://github.com/pokt-network/poktroll"
  url "https://github.com/pokt-network/poktroll/archive/refs/tags/v0.1.36.tar.gz"
  sha256 "821c3b8d749b4b9fa5c78bccd2aa081b83df4ee21c8f45a7c8b72ee6bb3c81a8"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_intel do  # on_macos_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.36/pocket_darwin_amd64.tar.gz"
      sha256 "28f2bd54debbd34b5495a6751f2320cbe61785d5bc4c05d563e439d1284ed344"
    end

    on_arm do # on_macos_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.36/pocket_darwin_arm64.tar.gz"
      sha256 "00e1e3ea529577b3f7a24236e975f4a271ef0b3f209dca0a3f94232669bc843b"
    end
  end

  on_linux do
    on_intel do # on_linux_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.36/pocket_linux_amd64.tar.gz"
      sha256 "4aae8436f25936dc79212a3f3b6079aafaaaba57edde09809a70aecd68e00eb7"
    end

    on_arm do # on_linux_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.36/pocket_linux_arm64.tar.gz"
      sha256 "5d73fe7f3f6d39f77a9861cb2c83d79ffe0fc86233e43e289fdcd09d62583fdf"
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