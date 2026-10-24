class SsdLlm < Formula
  desc "Run 70B+ LLMs on Apple Silicon using SSD as extended memory"
  homepage "https://github.com/quantumnic/ssd-llm"
  url "https://github.com/quantumnic/ssd-llm/archive/refs/tags/v1.39.0.tar.gz"
  sha256 "2a55f9e771630b800c632ae6ad9fea9fa63481ea59745530d72f4051f8d323b9"
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
