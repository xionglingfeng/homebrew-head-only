class RtlSdr < Formula
  homepage 'http://sdr.osmocom.org/trac/wiki/rtl-sdr'
  head 'git://git.osmocom.org/rtl-sdr.git'

  depends_on 'cmake' => :build
  depends_on "pkg-config" => :build
  depends_on 'libusb'

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end
end
