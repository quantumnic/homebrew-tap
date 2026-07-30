class SsdLlm < Formula
  desc "Run 70B+ LLMs on Apple Silicon using SSD as extended memory"
  homepage "https://github.com/quantumnic/ssd-llm"
  url "https://github.com/quantumnic/ssd-llm/archive/refs/tags/v1.39.0.tar.gz"
  sha256 "d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed"
  license "MIT"
  head "https://github.com/quantumnic/ssd-llm.git", branch: "main"

  depends_on "rust" => :build
  depends_on :macos

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "ssd-llm", shell_output("#{bin}/ssd-llm --help")
    assert_match version.to_s, shell_output("#{bin}/ssd-llm --version")
  end
end
