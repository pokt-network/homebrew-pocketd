class Pocketd < Formula
  desc "Pocket - A CLI tool for managing your Pocket Network nodes"
  homepage "https://github.com/pokt-network/poktroll"
  url "https://github.com/pokt-network/poktroll/archive/refs/tags/v0.1.33.tar.gz"
  sha256 "9ca9b5e08a7bc7261022681521f67d17cae0153d262f4e38c9dbf5387524e024"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_intel do  # on_macos_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.33/pocket_darwin_amd64.tar.gz"
      sha256 "23d7e8a81292800afa7d79e7207ad5edba955406a330bcb676a55fd39e356ed2"
    end

    on_arm do # on_macos_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.33/pocket_darwin_arm64.tar.gz"
      sha256 "14a275e8282d66f58c68d3043e51d60dc51f8914fd3d589c72442468132194dc"
    end
  end

  on_linux do
    on_intel do # on_linux_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.33/pocket_linux_amd64.tar.gz"
      sha256 "90ac9193d66b22f79b79ed97c7fcd6c4a60687866078081a31f3362bd5b9934f"
    end

    on_arm do # on_linux_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.33/pocket_linux_arm64.tar.gz"
      sha256 "e558a088b717aba866342d038a7a54cc9e2548ebdf24103006474bd5879bddbe"
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