class Libfreenect2 < Formula
  desc "Drivers and libraries for the Xbox Kinect device version 2"
  homepage "http://openkinect.org"
  head "https://github.com/OpenKinect/libfreenect2.git"

  option :universal

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "libusb"
  depends_on "jpeg-turbo"
  depends_on "glfw3"

  def install
    args = std_cmake_args

    inreplace "CMakeLists.txt", %r[  \$\{LibUSB_LIBRARIES\}], "usb-1.0"
    inreplace "CMakeLists.txt", %r[FIND_PACKAGE\(LibUSB REQUIRED\)], ""

    if build.universal?
      ENV.universal_binary
      args << "-DCMAKE_OSX_ARCHITECTURES=#{Hardware::CPU.universal_archs.as_cmake_arch_flags}"
    end

    mkdir "build" do
      args << "-DLibUSB_INCLUDE_DIRS=#{Formula["libusb"].include}/libusb-1.0"
      system "cmake", "..", *args
      system "make", "install"
    end
  end
end
