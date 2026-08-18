class Pocketd < Formula
  desc "Pocket - A CLI tool for managing your Pocket Network nodes"
  homepage "https://github.com/pokt-network/poktroll"
  url "https://github.com/pokt-network/poktroll/archive/refs/tags/v0.1.35.tar.gz"
  sha256 "c3cdd12a7bc829977e2762258d7e28c5ecbab299750f6713523ce66c397b840a"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_intel do  # on_macos_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.35/pocket_darwin_amd64.tar.gz"
      sha256 "e1f03ed45b892109924dab56423d29e443ab72ee018e3165a2453d8a55aa5317"
    end

    on_arm do # on_macos_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.35/pocket_darwin_arm64.tar.gz"
      sha256 "aa17f136079a708d8412521e9fc5538aec0267a1a721213f9b5e34e31be0aee3"
    end
  end

  on_linux do
    on_intel do # on_linux_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.35/pocket_linux_amd64.tar.gz"
      sha256 "99b88aa839a19d6b89b4923cadbc5848ba161a828e514ea9751dffd569066a3b"
    end

    on_arm do # on_linux_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.35/pocket_linux_arm64.tar.gz"
      sha256 "9a13cbf008a3e20a5cbb1daef588b253ec027c07d9c7252e5854c44d8d11abc9"
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