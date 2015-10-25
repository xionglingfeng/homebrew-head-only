class HgFastExport < Formula
  homepage "https://packages.debian.org/source/sid/hg-fast-export"
  head "git://repo.or.cz/fast-export.git"

  def install
    bin.install "hg-fast-export.py", "hg-fast-export.sh",
                "hg-reset.py", "hg-reset.sh",
                "hg2git.py"
  end
end
