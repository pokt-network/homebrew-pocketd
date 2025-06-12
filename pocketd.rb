class Pocketd < Formula
  desc "Pocket - A CLI tool for managing your Pocket Network nodes"
  homepage "https://github.com/pokt-network/poktroll"
  url "https://github.com/pokt-network/poktroll/archive/refs/tags/v0.1.19.tar.gz"
  sha256 "0d47aec0e113a4da9c0001507d5427f2e1322abc6ff3dca4967d2d70b6ad7755"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_intel do  # on_macos_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.19/pocket_darwin_amd64.tar.gz"
      sha256 "205063da39950daf738a8b75d9fac9546cb857ba6cbe5e8e374280811761f8a3"
    end

    on_arm do # on_macos_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.19/pocket_darwin_arm64.tar.gz"
      sha256 "e37786da6b542779e22e167381ed9aae53580ef9edaf9e067c5e7202c603943e"
    end
  end

  on_linux do
    on_intel do # on_linux_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.19/pocket_linux_amd64.tar.gz"
      sha256 "301d15e33b7cc368ee24e2a95f55a2a79af0e8749c5894c872ff0388c8bce2a5"
    end

    on_arm do # on_linux_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.19/pocket_linux_arm64.tar.gz"
      sha256 "9ce0d584933e0fa161edf6a93be1765cf65da2e2f7822fdeeb99af006ab366c0"
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