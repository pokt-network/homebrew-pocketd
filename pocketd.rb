class Pocketd < Formula
  desc "Pocket - A CLI tool for managing your Pocket Network nodes"
  homepage "https://github.com/pokt-network/poktroll"
  url "https://github.com/pokt-network/poktroll/archive/refs/tags/v0.1.34.tar.gz"
  sha256 "0e97fd48efc321136aace6caa8cec89f84aa4edb5ae2a29e77b0bbf921cf9268"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_intel do  # on_macos_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.34/pocket_darwin_amd64.tar.gz"
      sha256 "6ba8423a2790dcbc8be2a8d88187965811590a0f6a270001704e0809cc56ec97"
    end

    on_arm do # on_macos_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.34/pocket_darwin_arm64.tar.gz"
      sha256 "b38f6e3b4d8005905c1717e4b01e0e724e9fe7c27606139cc21397ad984438ef"
    end
  end

  on_linux do
    on_intel do # on_linux_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.34/pocket_linux_amd64.tar.gz"
      sha256 "4e777d8779e2981bdda3401a2ede31cca1ad5878cf430d7a43c7e981290e26a6"
    end

    on_arm do # on_linux_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.34/pocket_linux_arm64.tar.gz"
      sha256 "2591301c49a6091f92205594b5c42825310bb1d7f8c3e1dc8e2f9958a81a274e"
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