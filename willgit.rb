class Willgit < Formula
  desc "William's miscellaneous git tools"
  homepage "http://git-wt-commit.rubyforge.org"
  # This is a mirror; the original URL is down:
  # https://gitorious.org/willgit/mainline.git
  head "https://github.com/DanielVartanov/willgit.git"

  def install
    prefix.install "bin"
  end
end
