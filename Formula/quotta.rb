class Quotta < Formula
  desc "CLI for checking quota usage across providers"
  homepage "https://github.com/NaNomicon/quotta"
  url "https://github.com/NaNomicon/quotta/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "2fd95f1590580a07964efb253693b722ce533dbaa5ab6111e21ba2e36a5be180"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"quotta"), "./src/cmd/quotta"
  end

  test do
    output = shell_output("#{bin}/quotta -h", 1)
    assert_match "enter watch mode", output
  end
end
