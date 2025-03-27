class Pocketd < Formula
  desc "Pocket - A CLI tool for managing your Pocket Network nodes"
  homepage "https://github.com/pokt-network/pocket"
  url "https://github.com/pokt-network/poktroll/archive/refs/tags/v0.0.12.tar.gz"
  sha256 "2c3068aa3e03686c7376431514c366691fe51c1c8cccc51dd5fa5fd03a9ff579"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_intel do  # on_macos_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.0.12/pocket_darwin_amd64.tar.gz"
      sha256 "4c238a0fead59f7fb717ed5b5cafc1eaab0495eb0e496009987dd9dcaf1d3b6c"
    end

    on_arm do # on_macos_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.0.12/pocket_darwin_arm64.tar.gz"
      sha256 "8ae43768fc16274cdbad46457345accef6f1671e2ebc05df2871153dfa7cc918"
    end
  end

  on_linux do
    on_intel do # on_linux_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.0.12/pocket_linux_amd64.tar.gz"
      sha256 "9fe01fe64a272f642ca20e265a131f51609c8f556690219e5ee8a869d43562b5"
    end

    on_arm do # on_linux_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.0.12/pocket_linux_arm64.tar.gz"
      sha256 "b3231f1c752d26b97dab04607741b98229a48506d6195e699170d3ad55e1554f"
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