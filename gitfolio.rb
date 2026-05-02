class Gitfolio < Formula
  include Language::Python::Virtualenv

  desc "Turn your GitHub commits into ATS-friendly resume bullets. Automatically. Every week."
  homepage "https://github.com/pranav-iiitdm/gitfolio"
  url "https://files.pythonhosted.org/packages/source/g/gitfolio/gitfolio-1.0.0.tar.gz"
  sha256 "PLACEHOLDER"
  license "MIT"

  depends_on "python@3.11"

  resource "click" do
    url "https://files.pythonhosted.org/packages/source/c/click/click-8.1.8.tar.gz"
    sha256 "ed53c9d8821d609306e46898d207d9e77bb3b7b70a787f3a0ab02de9e7e6a29c"
  end

  resource "PyGithub" do
    url "https://files.pythonhosted.org/packages/source/P/PyGithub/PyGithub-2.6.1.tar.gz"
    sha256 "6bb529afe07fbe75a5d0f04e97696e8b0f15a38dc4d34a587c19b06f69d80a3c"
  end

  resource "anthropic" do
    url "https://files.pythonhosted.org/packages/source/a/anthropic/anthropic-0.52.0.tar.gz"
    sha256 "placeholder_anthropic_sha"
  end

  resource "PyYAML" do
    url "https://files.pythonhosted.org/packages/source/P/PyYAML/PyYAML-6.0.2.tar.gz"
    sha256 "d584d9ec91ad65861cc08d42e834324ef890a082e591037abe114850ff7bbc3e"
  end

  resource "flask" do
    url "https://files.pythonhosted.org/packages/source/f/flask/flask-3.1.0.tar.gz"
    sha256 "5f873c5184c897c8d9d1b05df1e3d01b14910ce69607a117bd3277098a5836ac"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"gitfolio", "--help"
  end
end
