class Blaise < Formula
  desc "Blaise AI agent CLI: run Blaise sessions on your own machines"
  homepage "https://askblaise.com"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/BlaiseAgent/cli/releases/download/v2026.10.6/blaise-2026.10.6-darwin-arm64.tar.gz"
      sha256 "5afb55c055995d47cafa19928183bb2ac674ecf9229bbbb3f58c2b6686b952c4"
    end
    on_intel do
      url "https://github.com/BlaiseAgent/cli/releases/download/v2026.10.6/blaise-2026.10.6-darwin-x64.tar.gz"
      sha256 "838320ccbf6fc90a231437f4030162d2f2a2a3b39a6dd047b09767e27e54c820"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/BlaiseAgent/cli/releases/download/v2026.10.6/blaise-2026.10.6-linux-arm64.tar.gz"
      sha256 "bde8908126de70efee5cfff46bf470013b7e7ab8b71e337fcb0c6064d4367b1e"
    end
    on_intel do
      url "https://github.com/BlaiseAgent/cli/releases/download/v2026.10.6/blaise-2026.10.6-linux-x64.tar.gz"
      sha256 "7ee162816e8dd7ff745268d2d9db25b888953ad18686fcb53d299b8946ad4988"
    end
  end

  # The binary carries its own runtime after the executable image; stripping would corrupt it.
  skip_clean "bin/blaise"

  def install
    bin.install "blaise"
  end

  def caveats
    <<~EOS
      Blaise runs agents with Claude Code, which has to be installed and signed in separately.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/blaise --version")
  end
end
