class Asn < Formula
  desc "Organization lookup and server tool (ASN / IPv4 / IPv6 / Prefix / AS Path)"
  homepage "https://github.com/nitefood/asn"
  url "https://github.com/nitefood/asn/archive/refs/tags/v0.74.tar.gz"
  sha256 "d51895526b1a98ae6865094aac10c1abb05b515005702f5a23ac8e1c60e159e8"
  license "MIT"
  head "https://github.com/nitefood/asn.git", branch: "master"


  depends_on "aha"
  depends_on "bash"
  depends_on "coreutils"
  depends_on "grepcidr"
  depends_on "ipcalc"
  depends_on "jq"
  depends_on "mtr"
  depends_on "nmap"

  uses_from_macos "curl"
  uses_from_macos "whois"

  livecheck do
    url "https://www.example.com/downloads/"
    regex(/href=.*?example[._-]v?(\d+(?:\.\d+)+)\.t/i)
  end

  def install
    bin.install "asn"
  end

  def caveats
    <<~EOS
      To enable the "AS path tracing" feature, MTR should be in $PATH.
      If a simple brew link doesn't work:
        brew link mtr
      One option could be to manually add a symbolic link to the MTR executable:
        sudo ln -sfn /usr/local/sbin/mtr /usr/local/bin/mtr
        sudo ln -sfn /usr/local/sbin/mtr-packet /usr/local/bin/mtr-packet
      Another option could be to have in $PATH the dir:
        /usr/local/sbin
    EOS
  end

  test do
    output = shell_output("#{bin}/asn -h 2>&1 | grep --line-buffered -E '\\s+\\d+\\.\\d+' | head -n 1")
    assert_match version.to_s, output.strip
  end
end
