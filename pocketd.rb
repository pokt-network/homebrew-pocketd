class Pocketd < Formula
  desc "Pocket - A CLI tool for managing your Pocket Network nodes"
  homepage "https://github.com/pokt-network/poktroll"
  url "https://github.com/pokt-network/poktroll/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "4c73bcfe41214a9285c5a5396020552ca777eb6b9defdba0f06b9e39fdf89b7a"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_intel do  # on_macos_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.0/pocket_darwin_amd64.tar.gz"
      sha256 "ba13ffb505b01b6edd59594ab68eff2fb33f42d191635b7750743b072e236f7c"
    end

    on_arm do # on_macos_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.0/pocket_darwin_arm64.tar.gz"
      sha256 "24b9d8d481f1ee2b992f4a9ab9483717b59e599bd3f38150b8d8ad42d7c7d8aa"
    end
  end

  on_linux do
    on_intel do # on_linux_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.0/pocket_linux_amd64.tar.gz"
      sha256 "82497691ae70d95544834714ed35b09bc5e2f404c2b1541eef69249be37e70fb"
    end

    on_arm do # on_linux_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.0/pocket_linux_arm64.tar.gz"
      sha256 "4bff80a3441fc2540d89e02ae538a596d22980c184f97a38d4686049380fab45"
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