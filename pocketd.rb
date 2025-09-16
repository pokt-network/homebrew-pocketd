class Pocketd < Formula
  desc "Pocket - A CLI tool for managing your Pocket Network nodes"
  homepage "https://github.com/pokt-network/poktroll"
  url "https://github.com/pokt-network/poktroll/archive/refs/tags/v0.1.29.tar.gz"
  sha256 "0a7de75d2f8efc0789501f0ead675983f366a6e06639a0ffaca3608762e7413d"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_intel do  # on_macos_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.29/pocket_darwin_amd64.tar.gz"
      sha256 "2da5cfa5c750f69f5198e32bf20fe57063d12066482f92f7b1a60265b3613c35"
    end

    on_arm do # on_macos_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.29/pocket_darwin_arm64.tar.gz"
      sha256 "12664327ac2ba2dc655bad90c8589fdc9a5cc20a90139d6f2a7725c8c012898f"
    end
  end

  on_linux do
    on_intel do # on_linux_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.29/pocket_linux_amd64.tar.gz"
      sha256 "7ed834295a783581ebecdc2d8ca6b22dfae8dc2d7f65fef402a379f5e80c94ec"
    end

    on_arm do # on_linux_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.1.29/pocket_linux_arm64.tar.gz"
      sha256 "559eca6696bdb8d54f006c636e56ba52b133989c10b2e7efbdf8e90ed2f1d148"
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