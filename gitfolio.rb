class Gitfolio < Formula
  desc "Turn your GitHub commits into ATS-friendly resume bullets. Automatically. Every week."
  homepage "https://github.com/pranav-iiitdm/gitfolio"
  url "https://files.pythonhosted.org/packages/source/g/gitfolio-cli/gitfolio_cli-1.0.0.tar.gz"
  sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
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
