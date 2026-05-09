class Gitfolio < Formula
  desc "Turn your GitHub commits into ATS-friendly resume bullets. Automatically. Every week."
  homepage "https://github.com/pranav-iiitdm/gitfolio"
  url "https://files.pythonhosted.org/packages/87/d3/2d1764773f9eb108c951f59c9517daf24f6a7a502a4233ce255094294d43/gitfolio_cli-1.0.0.tar.gz"
  sha256 "9d7584d5e2f504eaccb0d060a0aa7564046b1dffbfd54e14f92078fde8b8a239"
  license "MIT"

  def install
    # Use Python.org installer (Homebrew python@3.13 bottle broken on this OS)
    python = if File.exist?("/Library/Frameworks/Python.framework/Versions/3.13/bin/python3")
      "/Library/Frameworks/Python.framework/Versions/3.13/bin/python3"
    else
      "python3"
    end

    target = libexec/"lib"
    system python, "-m", "pip", "install", "--target=#{target}", "gitfolio-cli==#{version}"

    (bin/"gitfolio").write <<~EOS
      #!/bin/bash
      export PYTHONPATH="#{target}:$PYTHONPATH"
      exec "#{python}" -m gitfolio.cli "$@"
    EOS
    chmod 0755, bin/"gitfolio"
  end

  test do
    system bin/"gitfolio", "--help"
  end
end
