class Blaise < Formula
  desc "Blaise AI agent CLI: run Blaise sessions on your own machines"
  homepage "https://askblaise.com"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/BlaiseAgent/cli/releases/download/v2026.10.5/blaise-2026.10.5-darwin-arm64.tar.gz"
      sha256 "643e98a213d6e78a301b6737896de47e4a5a4bc961efe4652e8575617af46a16"
    end
    on_intel do
      url "https://github.com/BlaiseAgent/cli/releases/download/v2026.10.5/blaise-2026.10.5-darwin-x64.tar.gz"
      sha256 "5e2f56d33edc9d3b2953a1f92f617de5a5c6eb3d0eed5a0682c11496b3f98815"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/BlaiseAgent/cli/releases/download/v2026.10.5/blaise-2026.10.5-linux-arm64.tar.gz"
      sha256 "05aa608921075a901eaefefab88b62fbaebab4d799554fef4822ac3437a6a904"
    end
    on_intel do
      url "https://github.com/BlaiseAgent/cli/releases/download/v2026.10.5/blaise-2026.10.5-linux-x64.tar.gz"
      sha256 "67d3bda89271d2b1325b90e509d5ac9740cf6162a30428c10a20c506c703d972"
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
