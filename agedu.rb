require "formula"

class Agedu < Formula
  homepage 'http://www.chiark.greenend.org.uk/~sgtatham/agedu/'

  # The tarball here is not stable, and the checksum changes over time
  head "git://git.tartarus.org/simon/agedu.git"

  depends_on 'autoconf' => :build
  depends_on 'automake' => :build
  depends_on 'halibut' => :build

  def install
    system "./mkauto.sh"
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end

  test do
    system "#{bin}/agedu", "-s", "."
    assert File.exist?("agedu.dat")
  end
end
