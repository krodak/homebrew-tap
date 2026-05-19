class PlAgentSkills < Formula
  desc "PassiveLogic AI agent skills manager — install, sync, and track skills across AI coding platforms"
  homepage "https://gitlab.com/PassiveLogic/platform/pl-agent-skills"
  version "0.1.0"
  license "MIT"

  # TODO: Replace with GitLab release tarball URL when the repo is published.
  # For now, install from local clone: cd ~/repositories/pl-agent-skills && make install
  #
  # Future:
  #   url "https://gitlab.com/PassiveLogic/platform/pl-agent-skills/-/archive/v#{version}/pl-agent-skills-v#{version}.tar.gz"
  #   sha256 "..."
  head "https://gitlab.com/PassiveLogic/platform/pl-agent-skills.git", branch: "main"

  depends_on xcode: ["16.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/plskills"
    pkgshare.install "skills", "agents", "manifest.json"
  end

  def caveats
    <<~EOS
      Skills data installed to:
        #{pkgshare}

      Run initial setup:
        plskills init

      This auto-detects your AI platforms (Claude Code, OpenCode, Codex, Cursor)
      and saves configuration to ~/.config/plskills/config.json.

      Then install skills:
        plskills install
    EOS
  end

  test do
    assert_match "Manage PassiveLogic AI agent skills", shell_output("#{bin}/plskills --help")
    assert_match version.to_s, shell_output("#{bin}/plskills --version")
  end
end
