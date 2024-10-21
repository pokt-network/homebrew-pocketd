class Poktrolld < Formula
  desc "Official implementation of the Pocket Network Shannon Protocol"
  homepage "https://www.pokt.network"
  url "https://github.com/pokt-network/poktroll/archive/refs/tags/v0.0.9-3.tar.gz"
  sha256 "bb4728c94355d0f9cbfa9aa742f85ab46212d2c13b480c55fb7376674ce73efd"
  depends_on "go@1.23" => [:build, "1.23"]


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
