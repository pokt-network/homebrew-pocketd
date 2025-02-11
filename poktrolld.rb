class Poktrolld < Formula
  desc "Poktroll - A CLI tool for managing your Pocket Network nodes"
  homepage "https://github.com/pokt-network/poktroll"
  url "https://github.com/pokt-network/poktroll/archive/refs/tags/v0.0.12.tar.gz"
  sha256 "2c3068aa3e03686c7376431514c366691fe51c1c8cccc51dd5fa5fd03a9ff579"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_intel do  # on_macos_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.0.12/poktroll_darwin_amd64.tar.gz"
      sha256 "9d7abaf8c5ca87430c634c02153520c54dec0496aac590ff32b182446359a0cd"
    end

    on_arm do # on_macos_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.0.12/poktroll_darwin_arm64.tar.gz"
      sha256 "393f53e7cf4ce53229c9ee12b8efd1d5206e574ce625aad3233e05d4443f8e36"
    end
  end

  on_linux do
    on_intel do # on_linux_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.0.12/poktroll_linux_amd64.tar.gz"
      sha256 "f58710ffcbea837ef01ad9a9dad011a24b0a7483ffd8946fec890b738612c06f"
    end

    on_arm do # on_linux_do_not_remove
      url "https://github.com/pokt-network/poktroll/releases/download/v0.0.12/poktroll_linux_arm64.tar.gz"
      sha256 "823a64f9c75dff78210636b956765607c40697ac2668bc95b6eb6eb8067ba1ff"
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