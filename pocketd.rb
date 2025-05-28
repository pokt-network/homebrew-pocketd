class Pocketd < Formula
  desc "Pocket - A CLI tool for managing your Pocket Network nodes"
  homepage "https://github.com/pokt-network/poktroll"
  url "https://github.com/pokt-network/poktroll/archive/refs/tags/v0.1.12.tar.gz"
  sha256 "3eba8075b56c0ffc283496bebb8fbf0acf4bc92e37a17992094dab027d2c8f90"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_intel do  # on_macos_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.12/pocket_darwin_amd64.tar.gz"
      sha256 "6ab99b875943f2211cb3fd2ec035f885157298d357a3591a4a9587ea537b7d27"
    end

    on_arm do # on_macos_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.12/pocket_darwin_arm64.tar.gz"
      sha256 "56433aa1ab090ffe577a8ca406595f45a5c017bc69f935bce127d6811a04299e"
    end
  end

  on_linux do
    on_intel do # on_linux_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.12/pocket_linux_amd64.tar.gz"
      sha256 "63d2f765c7fb0ca57c437342f2dfe895ab42c2162d6e70e599e25d7909fc8b40"
    end

    on_arm do # on_linux_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.12/pocket_linux_arm64.tar.gz"
      sha256 "bc7ff3a01f801dc1f6e713b8006dd9695619f50513abe36d09c65de66fc18784"
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