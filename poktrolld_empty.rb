class Poktrolld < Formula
  desc "Poktroll - A CLI tool for managing your Pocket Network nodes"
  homepage "https://github.com/pokt-network/poktroll"
  url ""
  sha256 ""
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url ""
      sha256 ""
    end
  end

  on_macos do
    on_intel do
      url ""
      sha256 ""
    end
  end

  on_linux do
    on_arm do
      url ""
      sha256 ""
    end
  end

  on_linux do
    on_intel do
      url ""
      sha256 ""
    end
  end

  def install
    # Ensure that the binary name matches the extracted file
    bin.install "poktrolld"
  end

  test do
    # Replace with an actual test command
    system "#{bin}/poktrolld", "version"
  end
end