class ClickupCli < Formula
  desc "ClickUp CLI for AI agents and humans"
  homepage "https://github.com/krodak/clickup-cli"
  url "https://registry.npmjs.org/@krodak/clickup-cli/-/clickup-cli-1.7.0.tgz"
  sha256 "bdde6a896662745e7c0a0d0fa20ed83050f7e50322ce87456cdd721a053554f1"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cup --version")
  end
end
