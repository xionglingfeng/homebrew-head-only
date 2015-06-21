class Zzz < Formula
  desc "Command-line tool to put Macs to sleep"
  homepage "https://github.com/Orc/Zzz"
  head "https://github.com/Orc/Zzz.git"

  # No test is possible: this has no --help or --version, it just
  # sleeps the Mac instantly.
  def install
    inreplace "Makefile", "-lIOKit", "-framework IOKit"
    system "make"

    # make install is broken: doesn't create directories
    bin.install "zzz"
    man8.install "zzz.8"
  end
end
