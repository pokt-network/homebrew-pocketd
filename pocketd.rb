class Pocketd < Formula
  desc "Pocket - A CLI tool for managing your Pocket Network nodes"
  homepage "https://github.com/pokt-network/poktroll"
  url "https://github.com/pokt-network/poktroll/archive/refs/tags/v0.1.15.tar.gz"
  sha256 "0bc02f5cf3b1883b04640c45d84c4d90c7a1c421c625696ee8288e34c7ac1b62"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_intel do  # on_macos_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.15/pocket_darwin_amd64.tar.gz"
      sha256 "08cabada9bedb65e4b9066254fc1d75d6c0eb73ab2d692c707a31468f679f527"
    end

    on_arm do # on_macos_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.15/pocket_darwin_arm64.tar.gz"
      sha256 "d8fb4c398dc36a8b11aa272a8f556e6eaf75994dda05ee7aa862a7d3290cb496"
    end
  end

  on_linux do
    on_intel do # on_linux_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.15/pocket_linux_amd64.tar.gz"
      sha256 "c6dad69305ddde4b46c363c6d389eeb41dc470c7101a24e5aa93d04052ae6f65"
    end

    on_arm do # on_linux_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.15/pocket_linux_arm64.tar.gz"
      sha256 "33fd7de8893c65683c85918ca849a6835ef3436e919dc602d87eccdc4ce99a92"
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