cask "mmdbinspect" do
  version "0.1.1"
  sha256 "e1a83dc00119bab2101b6d37364065484ca271a68f732a34e87d87b913b693be"

  url "https://github.com/maxmind/mmdbinspect/releases/download/v#{version}/mmdbinspect_#{version}_darwin_amd64.tar.gz"
  appcast "https://github.com/maxmind/mmdbinspect/releases.atom"
  name "mmdbinspect"
  desc "Look up records for one or more IPs/networks in one or more .mmdb databases"
  homepage "https://github.com/maxmind/mmdbinspect"

  binary "mmdbinspect_#{version}_darwin_amd64/mmdbinspect"
end
