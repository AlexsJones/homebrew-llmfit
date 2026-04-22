class Llmfit < Formula
  desc "Terminal tool that right-sizes LLM models to your system hardware"
  homepage "https://github.com/AlexsJones/llmfit"
  version "0.0.0-signpath-test"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AlexsJones/llmfit/releases/download/v#{version}/llmfit-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "633aa470d0079b0695b971e0e0f382d6bff8b87b32368ae1dc9dc516da7efbff"
    else
      url "https://github.com/AlexsJones/llmfit/releases/download/v#{version}/llmfit-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "3cbe8fc499e3585dc738b86db5f48dc221924ad69a72e1531c7de14fc480a443"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AlexsJones/llmfit/releases/download/v#{version}/llmfit-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "73deed47c5e81909338c7bcc95e01f8bac935f69ec0c335dfc7f44187ddb3762"
    else
      url "https://github.com/AlexsJones/llmfit/releases/download/v#{version}/llmfit-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "736e442740cb91a3ce0793c2cbd29812c5b5ae12b603a4f0233ae60bd8aacdcd"
    end
  end

  def install
    bin.install "llmfit"
  end

  test do
    assert_match "llmfit", shell_output("#{bin}/llmfit --help")
  end
end
