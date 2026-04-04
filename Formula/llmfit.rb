class Llmfit < Formula
  desc "Terminal tool that right-sizes LLM models to your system hardware"
  homepage "https://github.com/AlexsJones/llmfit"
  version "0.8.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AlexsJones/llmfit/releases/download/v#{version}/llmfit-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "2f56d3e6066004e02ec31bb6d3b1b7f4a1971db0f0758d8fdcb06c0bcfe3fddd"
    else
      url "https://github.com/AlexsJones/llmfit/releases/download/v#{version}/llmfit-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "c2aaf54f62842b9c535a982608d7ef75b578fe04de827db215aaac0b717c8bb8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AlexsJones/llmfit/releases/download/v#{version}/llmfit-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c66957be5f9d63223d631d257e0d416edbe5b5786a54a283e3fc2b363ddf9d19"
    else
      url "https://github.com/AlexsJones/llmfit/releases/download/v#{version}/llmfit-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2be40881212242bbd202457e7122e565ca2fbbc7e83750ff61c7c8c6e28c01a2"
    end
  end

  def install
    bin.install "llmfit"
  end

  test do
    assert_match "llmfit", shell_output("#{bin}/llmfit --help")
  end
end
