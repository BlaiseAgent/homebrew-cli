class Blaise < Formula
  desc "Blaise AI agent CLI: run Blaise sessions on your own machines"
  homepage "https://askblaise.com"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/BlaiseAgent/cli/releases/download/v2026.10.4/blaise-2026.10.4-darwin-arm64.tar.gz"
      sha256 "45b339bef75b060418839e1b159ae7c0312d41eadf220d532085245a2ce217e3"
    end
    on_intel do
      url "https://github.com/BlaiseAgent/cli/releases/download/v2026.10.4/blaise-2026.10.4-darwin-x64.tar.gz"
      sha256 "26c11a9e4f8b4db7c4dc09adccceef8947e2a27b32acb382a856df75098c9701"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/BlaiseAgent/cli/releases/download/v2026.10.4/blaise-2026.10.4-linux-arm64.tar.gz"
      sha256 "c268baaa6f86cb1995ede9c705d28e094c90c482a7f2ed49c41139c18233350a"
    end
    on_intel do
      url "https://github.com/BlaiseAgent/cli/releases/download/v2026.10.4/blaise-2026.10.4-linux-x64.tar.gz"
      sha256 "838dda0dd2321ebe68f87babba2783d9d13a2df99c5196685e51fa3180a26ff4"
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
