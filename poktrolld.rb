class Poktrolld < Formula
  desc "Poktroll - A CLI tool for managing your Pocket Network nodes"
  homepage "https://github.com/pokt-network/poktroll"
  url "https://github.com/pokt-network/poktroll/archive/refs/tags/v0.0.10.tar.gz" # Replace with your release source tarball URL
  sha256 "1e9443af2c1bdee2ae70730c647f4440bdcf0173413144b790c7d8e1e1d798cd" # Replace with SHA-256 of the source tarball
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_intel do
      url "https://github.com/pokt-network/poktroll/releases/download/v0.0.11-rc/poktroll_darwin_arm64.tar.gz"
      sha256 "393f53e7cf4ce53229c9ee12b8efd1d5206e574ce625aad3233e05d4443f8e36"
    end
  end

  on_macos do
    on_arm do
      url "https://github.com/pokt-network/poktroll/releases/download/v0.0.11-rc/poktroll_darwin_amd64.tar.gz"
      sha256 "9d7abaf8c5ca87430c634c02153520c54dec0496aac590ff32b182446359a0cd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pokt-network/poktroll/releases/download/v0.0.11-rc/poktroll_linux_amd64.tar.gz"
      sha256 "f58710ffcbea837ef01ad9a9dad011a24b0a7483ffd8946fec890b738612c06f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pokt-network/poktroll/releases/download/v0.0.11-rc/poktroll_linux_arm64.tar.gz"
      sha256 "823a64f9c75dff78210636b956765607c40697ac2668bc95b6eb6eb8067ba1ff"
    end
  end

  def install
    bin.install "poktrolld" # Ensure that the binary name matches the extracted file
  end

  test do
    system "#{bin}/poktrolld", "version" # Replace with an actual test command
  end
end