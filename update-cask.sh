#!/bin/zsh
set -euo pipefail

version="${1:?usage: ./update-cask.sh X.Y.Z}"
cask="${0:A:h}/Casks/glassotp.rb"
url="https://github.com/Croakieee/GlassOTP/releases/download/v.${version}/GlassOTP.zip"

sha=$(curl -fsSL "$url" | shasum -a 256 | awk '{print $1}')

sed -i '' \
  -e "s/^  version \".*\"/  version \"${version}\"/" \
  -e "s/^  sha256 \".*\"/  sha256 \"${sha}\"/" \
  "$cask"

echo "glassotp ${version}"
echo "sha256 ${sha}"
