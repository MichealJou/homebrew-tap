class Foxpilot < Formula
  desc "Local multi-project task control CLI"
  homepage "https://github.com/MichealJou/FoxPoilt"
  version "0.1.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/MichealJou/FoxPoilt/releases/download/v0.1.4/foxpilot-darwin-arm64.tar.gz"
      sha256 "0d8c2ec16b873aa0aaa9b377e7db318277a298620547058a901493f8d42391d7"
    else
      url "https://github.com/MichealJou/FoxPoilt/releases/download/v0.1.4/foxpilot-darwin-x64.tar.gz"
      sha256 "78b16fb32cbbb95a919f90a3b838f5a58fdfdd8618de01251e649f7416134e35"
    end
  end

  on_linux do
    url "https://github.com/MichealJou/FoxPoilt/releases/download/v0.1.4/foxpilot-linux-x64.tar.gz"
    sha256 "531bd79fbe2832e551bc146991dd05ee9552ddb9cfdd5736443c32f2074f98bb"
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
