class Pocketd < Formula
  desc "Pocket - A CLI tool for managing your Pocket Network nodes"
  homepage "https://github.com/pokt-network/poktroll"
  url "https://github.com/pokt-network/poktroll/archive/refs/tags/v0.1.13.tar.gz"
  sha256 "4a24a92dd0301e2a337206aee06885c62d81506a3c555bfff3e46df5dbec7afe"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_intel do  # on_macos_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.13/pocket_darwin_amd64.tar.gz"
      sha256 "51789ecfad34123503f768e7d00f5cd588957557a5a4504821b0c6099015bb32"
    end

    on_arm do # on_macos_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.13/pocket_darwin_arm64.tar.gz"
      sha256 "0c117470a7b897789b7e82ac0b920d9ea7b339bbdd537586021d0bae36fb0c9a"
    end
  end

  on_linux do
    on_intel do # on_linux_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.13/pocket_linux_amd64.tar.gz"
      sha256 "9c81606901822a0ee4d9b543746536c6f7ee93ad6e9d9b091d706ead834f299f"
    end

    on_arm do # on_linux_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.13/pocket_linux_arm64.tar.gz"
      sha256 "d6784e8a6387c496edea8aae30cacb528c88d4de984f1b3addf8f5be81a11c60"
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