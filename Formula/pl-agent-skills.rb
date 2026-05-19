class PlAgentSkills < Formula
  desc "PassiveLogic AI agent skills manager — install, sync, and track skills across AI coding platforms"
  homepage "https://gitlab.com/PassiveLogic/platform/pl-agent-skills"
  version "0.1.0"
  license "MIT"

  # Temporary: local path until repo is on GitLab.
  # Replace with GitLab tarball URL when published:
  #   url "https://gitlab.com/PassiveLogic/platform/pl-agent-skills/-/archive/v#{version}/pl-agent-skills-v#{version}.tar.gz"
  #   sha256 "..."
  head "file://#{ENV["HOME"]}/repositories/pl-agent-skills", branch: "main"

  depends_on xcode: ["16.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/plskills"

    # Install skill data so the CLI can find it without a separate clone
    pkgshare.install "skills", "agents", "manifest.json"
  end

  def caveats
    <<~EOS
      Skills and manifest installed to:
        #{pkgshare}

      Run initial setup:
        plskills init

      The init command will auto-detect your AI platforms and save config
      to ~/.config/plskills/config.json.

      To use skills from a git clone instead of the Homebrew-installed copy
      (for development or to get the latest changes):
        plskills config --repo-path ~/repositories/pl-agent-skills
    EOS
  end

  test do
    assert_match "Manage PassiveLogic AI agent skills", shell_output("#{bin}/plskills --help")
    assert_match version.to_s, shell_output("#{bin}/plskills --version")
  end
end
