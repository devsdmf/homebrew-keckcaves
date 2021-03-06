require 'formula'

class Crusta < Formula
  ver = "1.0-131-gee93552"
  pkgver = "1"

  homepage "http://keckcaves.org/software/crusta"
  url "https://github.com/KeckCAVES/crusta.git", :revision => "v#{ver}"
  version "#{ver}-#{pkgver}"

  depends_on 'cmake' => :build
  depends_on 'pkg-config' => :build
  depends_on 'devsdmf/keckcaves/vrui'
  depends_on 'glew'
  depends_on 'gdal'
  depends_on 'fontconfig'
  depends_on 'ftgl'

  def install
    args = []
    args << "-DPROJECT_VERSION=#{version}"
    args << "-DINSTALL_TYPE=Local"
    args << "-DCMAKE_INSTALL_PREFIX=#{prefix}"
    args << "-DETC_DIR=#{etc}/#{name}"
    args << "-DCMAKE_PREFIX_PATH=#{HOMEBREW_PREFIX}"
    args << "-DCMAKE_RULE_MESSAGES=OFF" << "-DCMAKE_VERBOSE_MAKEFILE=ON"
    system "cmake", ".", *args
    system "make", "install"
  end
end
