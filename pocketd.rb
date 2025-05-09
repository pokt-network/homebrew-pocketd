class Pocketd < Formula
  desc "Pocket - A CLI tool for managing your Pocket Network nodes"
  homepage "https://github.com/pokt-network/poktroll"
  url "https://github.com/pokt-network/poktroll/archive/refs/tags/v0.1.10.tar.gz"
  sha256 "485d6b2986757b6a5c28d1df1c71ad386841d37e5e58bdec9df54b711294e672"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_intel do  # on_macos_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.10/pocket_darwin_amd64.tar.gz"
      sha256 "b8683f50deaaed53afc10c1ca340caef5f6f72f948e19eb34e308c0932f6923c"
    end

    on_arm do # on_macos_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.10/pocket_darwin_arm64.tar.gz"
      sha256 "37141b370c18aad7568d66d2530594af456ced154f23dc30e05ced4185740f1f"
    end
  end

  on_linux do
    on_intel do # on_linux_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.10/pocket_linux_amd64.tar.gz"
      sha256 "3ee4efc5a30e269c84700993acdb707ad6bb9d0ec9a902a8085cdfb6226024b1"
    end

    on_arm do # on_linux_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.10/pocket_linux_arm64.tar.gz"
      sha256 "694e154d61beffedbeaf4c049436eaea06ccd8a1873f352afd95920279dac680"
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