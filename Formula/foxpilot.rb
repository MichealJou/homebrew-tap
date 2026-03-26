class Foxpilot < Formula
  desc "Local multi-project task control CLI"
  homepage "https://github.com/MichealJou/FoxPoilt"
  version "0.1.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/MichealJou/FoxPoilt/releases/download/v0.1.2/foxpilot-darwin-arm64.tar.gz"
      sha256 "a4d8783194d8b284532d883c878b5d46b638faf3a3bacb27a5eacc1dde8c64e5"
    else
      url "https://github.com/MichealJou/FoxPoilt/releases/download/v0.1.2/foxpilot-darwin-x64.tar.gz"
      sha256 "ec93586bdcdcf607dc196a19be1f2088c2be2fe8402ab841f3465722a4291c2f"
    end
  end

  on_linux do
    url "https://github.com/MichealJou/FoxPoilt/releases/download/v0.1.2/foxpilot-linux-x64.tar.gz"
    sha256 "23fe75574b1d9d8b2b9223cc65278d1de30f93aa6ff8670a66dec6328c23d1e0"
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"foxpilot" => "foxpilot"
    bin.install_symlink libexec/"fp" => "fp"
  end

  test do
    assert_match "version", shell_output("#{bin}/foxpilot version")
  end
end
