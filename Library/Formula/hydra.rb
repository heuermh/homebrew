require "formula"

class Hydra < Formula
  homepage "https://www.thc.org/thc-hydra/"
  url "https://www.thc.org/releases/hydra-8.0.tar.gz"
  mirror "https://mirrors.kernel.org/debian/pool/main/h/hydra/hydra_8.0.orig.tar.gz"
  sha1 "d1a705985846caf77c291461f391a43457cc76e5"
  revision 1

  head "https://github.com/vanhauser-thc/thc-hydra"

  bottle do
    cellar :any
    revision 1
    sha1 "88d1c046dca54e6b93aefffc00df3699b384b345" => :mavericks
    sha1 "0b8994d32572ef721e4a65a871909b77e995094f" => :mountain_lion
    sha1 "a9682892cb112e109cac81dae9ae123aa2dd38e7" => :lion
  end

  depends_on "pkg-config" => :build
  depends_on :mysql
  depends_on "libssh" => :optional
  depends_on "openssl"

  def install
    system "./configure", "--prefix=#{prefix}"
    bin.mkpath
    system "make", "all", "install"
    share.install prefix/"man" # Put man pages in correct place
  end
end
