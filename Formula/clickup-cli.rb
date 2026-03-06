class ClickupCli < Formula
  desc "ClickUp CLI for AI agents and humans"
  homepage "https://github.com/krodak/clickup-cli"
  url "https://registry.npmjs.org/@krodak/clickup-cli/-/clickup-cli-0.12.0.tgz"
  sha256 "1f6c9e23f776aaa69dc27be7d6ba94b5db82673b5b42e38e80318e682a5eb687"
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
