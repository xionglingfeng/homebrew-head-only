class Xhyve < Formula
  desc "xhyve is a port of bhyve to OS X"
  homepage "https://github.com/mist64/xhyve"
  head "https://github.com/mist64/xhyve.git"

  depends_on MinimumMacOSRequirement => :yosemite

  def install
    system "make"
    bin.install "build/xhyve"
  end

  test do
    system "xhyve", "-h"
  end
end
