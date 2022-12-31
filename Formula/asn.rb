class Asn < Formula
  desc "Organization lookup and server tool (ASN / IPv4 / IPv6 / Prefix / AS Path)"
  homepage "https://github.com/nitefood/asn"
  url "https://raw.githubusercontent.com/nitefood/asn/6cb445632065a43afde84f513ce0ecf12c9d0877/asn"
  version "0.72.9"
  sha256 "e34f70f6cb9e6c46991130f924d31dfe8cc62abf39846dca328d52213c07a8bd"
  license "MIT"

  livecheck do
    skip "Cannot reliably check for new releases upstream"
  end

  def install
    bin.install "asn"
  end

  test do
    assert_match version.to_s, shell_output(%Q|sed -n 's/^ASN_VERSION="\\(.*\\)"$/\\1/p' #{bin}/asn|)
  end
end
