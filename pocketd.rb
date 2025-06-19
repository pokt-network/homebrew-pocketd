class Pocketd < Formula
  desc "Pocket - A CLI tool for managing your Pocket Network nodes"
  homepage "https://github.com/pokt-network/poktroll"
  url "https://github.com/pokt-network/poktroll/archive/refs/tags/v0.1.21.tar.gz"
  sha256 "3088b6ff3590c12e0ff4b84c25caaddbb2f02abf580aa903fc6c4e3cbead755a"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_intel do  # on_macos_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.21/pocket_darwin_amd64.tar.gz"
      sha256 "fd08b43a2d403c5baee274300b650bafd05b377d6e2ee0495ae86a163c68dd0c"
    end

    on_arm do # on_macos_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.21/pocket_darwin_arm64.tar.gz"
      sha256 "012f263933f676dabde58c3e340fb1e903d6c0567c86024e0e6692a251379abb"
    end
  end

  on_linux do
    on_intel do # on_linux_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.21/pocket_linux_amd64.tar.gz"
      sha256 "e87172bd4ed268fd49b4620f2baa230a5f7ccd1ad1e30c5919aab26e90ebe0bd"
    end

    on_arm do # on_linux_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.21/pocket_linux_arm64.tar.gz"
      sha256 "66619b7614489b15cca45e419a32043d566482fd3e3effc4adeddaf1f1acc831"
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