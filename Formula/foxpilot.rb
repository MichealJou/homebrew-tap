class Foxpilot < Formula
  desc "Local multi-project task control CLI"
  homepage "https://github.com/MichealJou/FoxPoilt"
  version "0.1.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/MichealJou/FoxPoilt/releases/download/v0.1.3/foxpilot-darwin-arm64.tar.gz"
      sha256 "21bfbba5d0611fa5d39a1870136d7d33251f6b433e5b26137fee081972a89018"
    else
      url "https://github.com/MichealJou/FoxPoilt/releases/download/v0.1.3/foxpilot-darwin-x64.tar.gz"
      sha256 "841487526317a48645eb829f2a49dc4fe4aefa13ff6ce1fd18aec41030b05ec1"
    end
  end

  on_linux do
    url "https://github.com/MichealJou/FoxPoilt/releases/download/v0.1.3/foxpilot-linux-x64.tar.gz"
    sha256 "46b893e1f2f72f2ede9fad9c3829874064a9985ecabbc4f960a9b9e889f35902"
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
