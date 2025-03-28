class Pocketd < Formula
  desc "Pocket - A CLI tool for managing your Pocket Network nodes"
  homepage "https://github.com/pokt-network/poktroll"
  url "https://github.com/pokt-network/poktroll/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "b9479e20c3e2e125e19ffa48ecf82f0ddf9f1f6e3e77a3326d557d591aa0ca1e"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_intel do  # on_macos_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.0/pocket_darwin_amd64.tar.gz"
      sha256 "ac0112e43ca4d37da7fb389bebd3d77e894530302752007aec92b82a0a9d5119"
    end

    on_arm do # on_macos_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.0/pocket_darwin_arm64.tar.gz"
      sha256 "0ad67a7696976adfc893bd50714926d4655680104dfc0bc9190d9eab4fc80ba6"
    end
  end

  on_linux do
    on_intel do # on_linux_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.0/pocket_linux_amd64.tar.gz"
      sha256 "7baa1309d44cfc4021d01ec11dae1dd67741126243106cc49b87e63778b8bbb6"
    end

    on_arm do # on_linux_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.0/pocket_linux_arm64.tar.gz"
      sha256 "47c3cb4671b499242648c737b7b5bcdaef7feb7b1ccf79f91c2060abd0803d2e"
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