class Pocketd < Formula
  desc "Pocket - A CLI tool for managing your Pocket Network nodes"
  homepage "https://github.com/pokt-network/poktroll"
  url "https://github.com/pokt-network/poktroll/archive/refs/tags/v0.1.28.tar.gz"
  sha256 "5ab3054c3d1301f21e458bcbcef2211c8c55937f84f2deabf4c9907198c85faa"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_intel do  # on_macos_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.28/pocket_darwin_amd64.tar.gz"
      sha256 "652b17053d5a75c54280848a25ec3bb538a316aa4183f2c067c99df733d33064"
    end

    on_arm do # on_macos_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.28/pocket_darwin_arm64.tar.gz"
      sha256 "0e7ff3478d1091cdbd8cb1854dc0316d475d1aba03c6c766949bb76a69dc91a1"
    end
  end

  on_linux do
    on_intel do # on_linux_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.28/pocket_linux_amd64.tar.gz"
      sha256 "98b11f11af40d7c3f166579f14a5f270c964a5e6b9673040a6cebaf448fb2d40"
    end

    on_arm do # on_linux_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.28/pocket_linux_arm64.tar.gz"
      sha256 "01a7caae492d38e773ef54a16a82ba211343925e2f1ecd9e756121be57a59784"
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