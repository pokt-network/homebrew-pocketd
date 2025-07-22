class Pocketd < Formula
  desc "Pocket - A CLI tool for managing your Pocket Network nodes"
  homepage "https://github.com/pokt-network/poktroll"
  url "https://github.com/pokt-network/poktroll/archive/refs/tags/v0.1.26.tar.gz"
  sha256 "227bc461b35e8e4d874cc1a8df94e474c824440aab322ecb5fc76d80f732e527"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_intel do  # on_macos_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.26/pocket_darwin_amd64.tar.gz"
      sha256 "29b46d431be9c3595db4f262401a2695133750133ce9042935699258bb62733f"
    end

    on_arm do # on_macos_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.26/pocket_darwin_arm64.tar.gz"
      sha256 "4e447630a481a5516c5dbc94cf8a8320cfd563aefe0f9e0042ff39b5667b627a"
    end
  end

  on_linux do
    on_intel do # on_linux_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.26/pocket_linux_amd64.tar.gz"
      sha256 "9fd41c23d1d3d652d5c2b5488feb05a0a96aba67c9e5b8e8f60ac80ad38297cb"
    end

    on_arm do # on_linux_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.26/pocket_linux_arm64.tar.gz"
      sha256 "1507a5d23796eaa79a6065748882dc162ef807228df44fdd3b3db8163d932bc9"
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