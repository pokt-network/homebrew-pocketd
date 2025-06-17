class Pocketd < Formula
  desc "Pocket - A CLI tool for managing your Pocket Network nodes"
  homepage "https://github.com/pokt-network/poktroll"
  url "https://github.com/pokt-network/poktroll/archive/refs/tags/v0.1.20.tar.gz"
  sha256 "aee76f55cdabbd220c5019a2584b0c81b0f0740b9426bf43bec20d1d5655c51e"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_intel do  # on_macos_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.20/pocket_darwin_amd64.tar.gz"
      sha256 "2dae01ad5535c7bdd7bf63ff597ee888e9549aa5b8cff406c67c8b449466014a"
    end

    on_arm do # on_macos_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.20/pocket_darwin_arm64.tar.gz"
      sha256 "f0c84b43682e7be7b6a2b8bad4e0df51ea2326fdba83ffea561b2548216c394d"
    end
  end

  on_linux do
    on_intel do # on_linux_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.20/pocket_linux_amd64.tar.gz"
      sha256 "61833723f4d320a1fdcac4b5b57f97b453fbdcdf934d7a6e9cab0e77b80768b7"
    end

    on_arm do # on_linux_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.20/pocket_linux_arm64.tar.gz"
      sha256 "5e97820f99edf5c876d890eb66c140b5317abe7c930945cf5a9ccc4ad8f86ef3"
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