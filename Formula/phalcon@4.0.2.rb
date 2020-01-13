require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class PhalconAT402 < AbstractPhp74Extension
  init
  desc "Full-stack PHP framework"
  homepage "https://phalconphp.com/"
  url "https://github.com/phalcon/cphalcon/archive/v4.0.2.tar.gz"
  sha256 "db54ad12010e2f38c4a573e4552362f9199bbdd828033546e676bb466c5dbaf0"
  head "https://github.com/phalcon/cphalcon.git"

  bottle do
    cellar :any_skip_relocation
    root_url "https://github.com/phalcon/homebrew-tap/releases/download/v4.0.2"
    # sha256 "607eaf8613d7d02dd0529fd641978e2a814cb525d502ab882aded143bcda97e4" => :catalina
    # sha256 "e645dfbf9cb485380f7cd92740dc5dcd30f8b6f4b9051ee3f8ec11f903e9243a" => :mojave
    # sha256 "2b827bbdd2b52f136af1cfa1e209457f0264c5d9a0804345982e0a57d50aa940" => :high_sierra
    # sha256 "8f04465129e223fa9e261a73ce3a9d7cdecf6786890c854bd38b560852ed6ec6" => :sierra
  end

  depends_on "pcre"
  depends_on "psr"

  def install
    Dir.chdir "build/php7/64bits"

    safe_phpize

    system "./configure", "--prefix=#{prefix}", phpconfig, "--enable-phalcon"
    system "make"

    prefix.install "modules/phalcon.so"
    write_config_file if build.with? "config-file"
  end
end
