class Foxpilot < Formula
  desc "Local multi-project task control CLI"
  homepage "https://github.com/MichealJou/FoxPoilt"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/MichealJou/FoxPoilt/releases/download/v0.1.0/foxpilot-darwin-arm64.tar.gz"
      sha256 "ae55addc18be7516fec179fd8ed061892d66d11673e4621d23be5559944e53e1"
    else
      url "https://github.com/MichealJou/FoxPoilt/releases/download/v0.1.0/foxpilot-darwin-x64.tar.gz"
      sha256 "9065b6e0ac37af746464277eae297e729d80f343b933241b03996d77dcc911a0"
    end
  end

  on_linux do
    url "https://github.com/MichealJou/FoxPoilt/releases/download/v0.1.0/foxpilot-linux-x64.tar.gz"
    sha256 "8bdc47c19414067159e07c93f45d44e884a8a6a6054b3d463d4b968bc294a0c7"
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
