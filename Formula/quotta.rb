class Quotta < Formula
  desc "CLI for checking quota usage across providers"
  homepage "https://github.com/NaNomicon/quotta"
  url "https://github.com/NaNomicon/quotta/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "6f6e8b372e7552d5961ad3b3504b847dfe843376e17fa25a9b6a591676cc926b"
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
