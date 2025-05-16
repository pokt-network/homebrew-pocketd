class Pocketd < Formula
  desc "Pocket - A CLI tool for managing your Pocket Network nodes"
  homepage "https://github.com/pokt-network/poktroll"
  url "https://github.com/pokt-network/poktroll/archive/refs/tags/v0.1.11.tar.gz"
  sha256 "f4f876ae6d2a2971b829061212ccf59b606900a19b971b9311569e12bce25d2d"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_intel do  # on_macos_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.11/pocket_darwin_amd64.tar.gz"
      sha256 "a795a6612740db745065f8f8423d4f3824c94aeda1d803b299b04240b5080c01"
    end

    on_arm do # on_macos_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.11/pocket_darwin_arm64.tar.gz"
      sha256 "13477e8ee33becc1ad695a01cc1180caf8786076f17106384e24fef98ff14311"
    end
  end

  on_linux do
    on_intel do # on_linux_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.11/pocket_linux_amd64.tar.gz"
      sha256 "63d2f765c7fb0ca57c437342f2dfe895ab42c2162d6e70e599e25d7909fc8b40"
    end

    on_arm do # on_linux_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.11/pocket_linux_arm64.tar.gz"
      sha256 "ef1e1673a192c44b9eb7188525578d02ebea39ceebc2cca9bb0b6aace55d8789"
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