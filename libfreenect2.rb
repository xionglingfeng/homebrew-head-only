require "formula"

class Libfreenect2 < Formula
  desc "Drivers and libraries for the Xbox Kinect device version 2"
  homepage "http://openkinect.org"
  #url "https://github.com/OpenKinect/libfreenect/archive/v0.5.1.tar.gz"
  #sha1 "1f7296e50c27c07e2f57ee906c195cabf97c1438"

  head "https://github.com/OpenKinect/libfreenect2.git"

  option :universal

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "libusb"
  depends_on "jpeg-turbo"

  def install
    args = std_cmake_args

    inreplace "examples/protonect/CMakeLists.txt", /  \$\{LibUSB_LIBRARIES\}/, "usb-1.0"

    if build.universal?
      ENV.universal_binary
      args << "-DCMAKE_OSX_ARCHITECTURES=#{Hardware::CPU.universal_archs.as_cmake_arch_flags}"
    end

    mkdir "build" do
      args << "-DLibUSB_INCLUDE_DIRS=#{Formula["libusb"].include}/libusb-1.0"
      system "cmake", "../examples/protonect", *args
      system "make install"
    end
  end
end
