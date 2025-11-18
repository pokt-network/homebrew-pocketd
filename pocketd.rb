class Pocketd < Formula
  desc "Pocket - A CLI tool for managing your Pocket Network nodes"
  homepage "https://github.com/pokt-network/poktroll"
  url "https://github.com/pokt-network/poktroll/archive/refs/tags/v0.1.30.tar.gz"
  sha256 "102131b2e93aa500521476068f980197f36bad19b41c4a5e32e54ea7ed8442f8"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_intel do  # on_macos_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.30/pocket_darwin_amd64.tar.gz"
      sha256 "ee0779b730c4a153d72c68382443b4f1a54ba0e4309fe9d46cf5da9921185f61"
    end

    on_arm do # on_macos_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.30/pocket_darwin_arm64.tar.gz"
      sha256 "2b2b3b2e32279ffadbcba372c4813fca9ba3da6e916a617803011477933fc9f6"
    end
  end

  on_linux do
    on_intel do # on_linux_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.30/pocket_linux_amd64.tar.gz"
      sha256 "028621a822f74e876435b2b1efd7c349440a2eedbbd40de654bce2191ae0ee09"
    end

    on_arm do # on_linux_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.30/pocket_linux_arm64.tar.gz"
      sha256 "6f28ca412aa7c557ebb7bd917a6280822c2f0a4de5a66a1c594c5b965d6dca41"
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