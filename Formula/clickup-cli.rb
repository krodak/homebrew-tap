class ClickupCli < Formula
  desc "ClickUp CLI for AI agents and humans"
  homepage "https://github.com/krodak/clickup-cli"
  url "https://registry.npmjs.org/@krodak/clickup-cli/-/clickup-cli-0.6.1.tgz"
  sha256 "0b81565f4cce484b142fea5ee45e53e22020fd862899748b56e0f32027ebb8ee"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args(libexec)
    bin.install_symlink libexec/"bin/cu"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cu --version")
  end
end
