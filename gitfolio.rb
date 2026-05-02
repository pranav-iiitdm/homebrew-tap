class Gitfolio < Formula
  include Language::Python::Virtualenv

  desc "Turn your GitHub commits into ATS-friendly resume bullets. Automatically. Every week."
  homepage "https://github.com/pranav-iiitdm/gitfolio"
  url "https://files.pythonhosted.org/packages/87/d3/2d1764773f9eb108c951f59c9517daf24f6a7a502a4233ce255094294d43/gitfolio_cli-1.0.0.tar.gz"
  sha256 "9d7584d5e2f504eaccb0d060a0aa7564046b1dffbfd54e14f92078fde8b8a239"
  license "MIT"

  depends_on "python@3.11"

  def install
    virtualenv_create(libexec, "python@3.11")
    system libexec/"bin/pip", "install", "gitfolio-cli==#{version}"
    bin.install_symlink libexec/"bin/gitfolio"
  end

  test do
    system bin/"gitfolio", "--help"
  end
end
