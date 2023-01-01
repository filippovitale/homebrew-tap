class Asn < Formula
  desc "Organization lookup and server tool (ASN / IPv4 / IPv6 / Prefix / AS Path)"
  homepage "https://github.com/nitefood/asn"
  url "https://raw.githubusercontent.com/nitefood/asn/6cb445632065a43afde84f513ce0ecf12c9d0877/asn"
  version "0.72.9"
  sha256 "e34f70f6cb9e6c46991130f924d31dfe8cc62abf39846dca328d52213c07a8bd"
  license "MIT"

  depends_on "bash"
  depends_on "coreutils"
  depends_on "curl"
  depends_on "whois"
  depends_on "mtr"
  depends_on "jq"
  depends_on "ipcalc"
  depends_on "grepcidr"
  depends_on "nmap"
  depends_on "aha"

  livecheck do
    skip "Cannot reliably check for new releases upstream"
  end

  def install
    bin.install "asn"
  end

  def caveats
    <<~EOS
      To enable the "AS path tracing" feature, MTR should be in $PATH.
      One option could be to manually add a symbolic link to the MTR executable:
        sudo ln -sfn /usr/local/sbin/mtr /usr/local/bin/mtr
        sudo ln -sfn /usr/local/sbin/mtr-packet /usr/local/bin/mtr-packet
      Another option could be to have in $PATH the dir:
        /usr/local/sbin
    EOS
  end

  test do
    assert_match version.to_s, shell_output(%Q|sed -n 's/^ASN_VERSION="\\(.*\\)"$/\\1/p' #{bin}/asn|)
  end
end
