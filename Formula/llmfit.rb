class Llmfit < Formula
  desc "Terminal tool that right-sizes LLM models to your system hardware"
  homepage "https://github.com/AlexsJones/llmfit"
  version "0.7.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AlexsJones/llmfit/releases/download/v#{version}/llmfit-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "b48f0de1a525f3dede8210b5dd2061f1f1b4e744a96cf3cf74ef17133a4cae38"
    else
      url "https://github.com/AlexsJones/llmfit/releases/download/v#{version}/llmfit-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "654d91479a0bcaf4979e355adfc31b9ac8376bcd0a6aea1f7011ffa1e5f5ed81"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AlexsJones/llmfit/releases/download/v#{version}/llmfit-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9a70a0bc33da91420a3c4f937acc5a98d2c2857d43e38faffc146b1852d0a12b"
    else
      url "https://github.com/AlexsJones/llmfit/releases/download/v#{version}/llmfit-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6e45d977ac8b8cbf98ff4af39fa6bba4320d9fd83b1e610807b94bb3fde2d7f8"
    end
  end

  def install
    bin.install "llmfit"
  end

  test do
    assert_match "llmfit", shell_output("#{bin}/llmfit --help")
  end
end
