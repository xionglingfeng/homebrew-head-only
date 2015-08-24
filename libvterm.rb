class Libvterm < Formula
  desc "Library implementation of a terminal emulator."
  homepage "https://launchpad.net/libvterm/"
  head "https://github.com/neovim/libvterm.git"

  depends_on "libtool" => :build

  def install
    system "make"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system bin/"vterm-ctrl", "reset"
  end
end
