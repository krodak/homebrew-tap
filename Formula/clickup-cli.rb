class ClickupCli < Formula
  desc "ClickUp CLI for AI agents and humans"
  homepage "https://github.com/krodak/clickup-cli"
  url "https://registry.npmjs.org/@krodak/clickup-cli/-/clickup-cli-1.30.1.tgz"
  sha256 "bfa1e4ba65440fa78ec538d117684b84cf002a943ac9f825f3a2f4d44be7a7e7"
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
