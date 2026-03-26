class Foxpilot < Formula
  desc "Local multi-project task control CLI"
  homepage "https://github.com/MichealJou/FoxPoilt"
  version "0.1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/MichealJou/FoxPoilt/releases/download/v0.1.1/foxpilot-darwin-arm64.tar.gz"
      sha256 "ec37eeebe43e59933995ebbebf00e543faa34ff283f229083ababae484ca12a8"
    else
      url "https://github.com/MichealJou/FoxPoilt/releases/download/v0.1.1/foxpilot-darwin-x64.tar.gz"
      sha256 "c9c81382afc5f6d557baa5405a18fefad1d6fbcb706554d53a87124647ae7c08"
    end
  end

  on_linux do
    url "https://github.com/MichealJou/FoxPoilt/releases/download/v0.1.1/foxpilot-linux-x64.tar.gz"
    sha256 "a68ab39c402fa608670e6a5f3514b1d01765f678614c7e36b0d4a87af8390096"
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
