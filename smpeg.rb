class Smpeg < Formula
  homepage "http://icculus.org/smpeg/"
  head "svn://svn.icculus.org/smpeg/trunk"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build
  depends_on "sdl2"
  depends_on "gtk+"

  def install
    system "./autogen.sh"
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--disable-sdltest",
                          # For non-/usr/local installs
                          "--with-sdl-prefix=#{Formula["sdl2"].opt_prefix}"
    # Install script is not +x by default for some reason
    chmod 0755, "./install-sh"
    system "make", "install"
  end
end
