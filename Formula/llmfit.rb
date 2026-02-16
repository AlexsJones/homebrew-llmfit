class Llmfit < Formula
  desc "Terminal tool that right-sizes LLM models to your system hardware"
  homepage "https://github.com/AlexsJones/llmfit"
  version "0.1.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AlexsJones/llmfit/releases/download/v#{version}/llmfit-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "621784d8786c14a102000651990b5010571231b9d449bdb00124890657900ee6"
    else
      url "https://github.com/AlexsJones/llmfit/releases/download/v#{version}/llmfit-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "1a758a66e3d88f92d2f8cffdc619d7feee0b34c8c8478434bb92a7730a93ae33"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AlexsJones/llmfit/releases/download/v#{version}/llmfit-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e517f3d28a6e2353be3c641911e865e6534ac0a8d5c1abaaf8ebc374ca0dc894"
    else
      url "https://github.com/AlexsJones/llmfit/releases/download/v#{version}/llmfit-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "21ca7583225b661ebec9550108b17376cc4150086a8559bb9c5ea96bb3cf1e1c"
    end
  end

  def install
    bin.install "llmfit"
  end

  test do
    assert_match "llmfit", shell_output("#{bin}/llmfit --help")
  end
end
