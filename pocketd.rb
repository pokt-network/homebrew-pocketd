class Pocketd < Formula
  desc "Pocket - A CLI tool for managing your Pocket Network nodes"
  homepage "https://github.com/pokt-network/poktroll"
  url "https://github.com/pokt-network/poktroll/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "fe1cac68965cde7e6857e92afd7d8c424275da1b4daab18f6dd5d339913b10a8"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_intel do  # on_macos_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.3/pocket_darwin_amd64.tar.gz"
      sha256 "9ee0db84826929a881248221da576686ca0053269082a9762fb59b24de64e319"
    end

    on_arm do # on_macos_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.3/pocket_darwin_arm64.tar.gz"
      sha256 "3fc5b43a0d6803e03765ee04d3d844b34e6c34f814511bedef245292d6c15545"
    end
  end

  on_linux do
    on_intel do # on_linux_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.3/pocket_linux_amd64.tar.gz"
      sha256 "2f31304058dab3ab41185e9c0c29ff015c036c350240a99b1a6be86db1c3fbfb"
    end

    on_arm do # on_linux_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.3/pocket_linux_arm64.tar.gz"
      sha256 "83267ac324df37b5cd3f9c7568ff6046c93cd3d828778529a2dd3977a7ca0422"
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