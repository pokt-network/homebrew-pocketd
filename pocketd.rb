class Pocketd < Formula
  desc "Pocket - A CLI tool for managing your Pocket Network nodes"
  homepage "https://github.com/pokt-network/poktroll"
  url "https://github.com/pokt-network/poktroll/archive/refs/tags/v0.1.22.tar.gz"
  sha256 "09151521f3f42c8f8681ed080bedc8b78ee985fdf4c9586d4e95751e5af302af"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_intel do  # on_macos_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.22/pocket_darwin_amd64.tar.gz"
      sha256 "af5344420792c8ce52115364bdd43b32ca5d7994a365b5ac810a3c5f53cf469d"
    end

    on_arm do # on_macos_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.22/pocket_darwin_arm64.tar.gz"
      sha256 "559e9e9c50f2dacfa9a0b1d53cc981937f0e7f6b23090a92b7db3621d36d8da1"
    end
  end

  on_linux do
    on_intel do # on_linux_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.22/pocket_linux_amd64.tar.gz"
      sha256 "4e61a628fdbcc90a9c2b1ceb55bac9cbd77ae0c8162506443ee0ad1d50d60024"
    end

    on_arm do # on_linux_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.22/pocket_linux_arm64.tar.gz"
      sha256 "831ffa0951d2a19217e7f7ca47658947f21a0006a9d1a57bca401a4fa19d5557"
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