class Gitfolio < Formula
  desc "Turn your GitHub commits into ATS-friendly resume bullets. Automatically. Every week."
  homepage "https://github.com/pranav-iiitdm/gitfolio"
  url "https://files.pythonhosted.org/packages/source/g/gitfolio/gitfolio-1.0.0.tar.gz"
  sha256 "PLACEHOLDER"
  license "MIT"

  depends_on "python@3.11"

  def install
    virtualenv_create(libexec, "python@3.11")
    system libexec/"bin/pip", "install", "gitfolio==#{version}"
    bin.install_symlink libexec/"bin/gitfolio"
  end

  test do
    system bin/"gitfolio", "--help"
  end
end
