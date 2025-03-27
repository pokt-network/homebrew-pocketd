class Pocketd < Formula
  desc "Pocket - A CLI tool for managing your Pocket Network nodes"
  homepage "https://github.com/pokt-network/pocket"
  url ""
  sha256 ""
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_intel do  # on_macos_do_not_remove
      url ""
      sha256 ""
    end

    on_arm do # on_macos_do_not_remove
      url ""
      sha256 ""
    end
  end

  on_linux do
    on_intel do # on_linux_do_not_remove
      url ""
      sha256 ""
    end

    on_arm do # on_linux_do_not_remove
      url ""
      sha256 ""
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