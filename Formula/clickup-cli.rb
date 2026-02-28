class ClickupCli < Formula
  desc "ClickUp CLI for AI agents and humans"
  homepage "https://github.com/krodak/clickup-cli"
  url "https://registry.npmjs.org/@krodak/clickup-cli/-/clickup-cli-0.8.0.tgz"
  sha256 "8983bf1099a97f41ef0e695fa02c7a6ca984d27c6e298ac5ed4a9c6b4e022f9f"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cu --version")
  end
end
