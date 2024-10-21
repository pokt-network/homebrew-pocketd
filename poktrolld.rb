class Poktrolld < Formula
  desc "Official implementation of the Pocket Network Shannon Protocol"
  homepage "https://www.pokt.network"
  # https://github.com/pokt-network/poktroll/releases
  url "https://github.com/pokt-network/poktroll/archive/refs/tags/v0.0.9-3.tar.gz"
  sha256 "93000de9310a24769e6c2fb7755dda9d97520c71bd7d1a812c81006f4736a77f"
  depends_on "go@1.23" => [:build, "1.23"]


  # TODO(@olshansk): Some links to keep going
  # - Mac permissions: https://stackoverflow.com/questions/60112375/apple-cannot-check-it-for-malicious-software-in-every-installation
  # - Releases: https://github.com/pokt-network/poktroll/releases
  # - Installing pre-built binary: https://github.com/orgs/Homebrew/discussions/2790

  def install
    make ignite_install
    make ignite_poktrolld_build
    # ENV["GOPATH"] = buildpath
    # bin_path = buildpath/"src/github.com/pokt-network/pocket-core"
    # Copy all files from their current location (GOPATH root)
    # to $GOPATH/src/github.com/pokt-network/pocket-core
    # bin_path.install Dir["*"]
    # cd bin_path do
      # Install the compiled binary into Homebrew's `bin` - a pre-existing
      # global variable
    #   system "go", "mod", "vendor"
    #   system "go", "build", "-tags", "cleveldb", "-o", bin/"pocket", "./app/cmd/pocket_core/main.go"
    # end
  end

  test do
    shell_output("#{bin}/poktrolld", "help")
  end
end
