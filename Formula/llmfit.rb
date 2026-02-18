class Llmfit < Formula
  desc "Terminal tool that right-sizes LLM models to your system hardware"
  homepage "https://github.com/AlexsJones/llmfit"
  version "0.2.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AlexsJones/llmfit/releases/download/v#{version}/llmfit-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "ea3a8c28480f4ff361d7d839474262cce8d4f875a2f9bb75c4b26915037b79bd"
    else
      url "https://github.com/AlexsJones/llmfit/releases/download/v#{version}/llmfit-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "3d5c72eeac6a3121598798f8bb53c0d1a20b1a359cbc3175d073c219b3838b0e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AlexsJones/llmfit/releases/download/v#{version}/llmfit-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d4d16fb6db5b942405b9d3321189c6c9302a057e7179a034c5f670f975fce2f8"
    else
      url "https://github.com/AlexsJones/llmfit/releases/download/v#{version}/llmfit-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "251940f5887f1297ee154eda14adbf0d62075be4fe1882d2ab5d2fa336eb372a"
    end
  end

  def install
    bin.install "llmfit"
  end

  test do
    assert_match "llmfit", shell_output("#{bin}/llmfit --help")
  end
end
