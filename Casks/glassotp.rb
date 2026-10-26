cask "glassotp" do
  version "1.3.2"
  sha256 "15ddc3024e4485136cbad85eb09cd59914eda6c39487ae9118c16d1930a7b742"

  url "https://github.com/Croakieee/GlassOTP/releases/download/v.#{version}/GlassOTP.zip"
  name "GlassOTP"
  desc "Menu bar authenticator for TOTP, HOTP and Steam Guard codes"
  homepage "https://github.com/Croakieee/GlassOTP"

  livecheck do
    url :url
    regex(/^v\.?(\d+(?:\.\d+)+)$/i)
    strategy :github_latest
  end

  depends_on macos: :big_sur

  app "GlassOTP/GlassOTP.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/GlassOTP.app"]
  end

  uninstall launchctl: "com.glassotp.loginitem",
            quit:      "com.yourname.GlassOTP"

  zap trash: [
    "~/Library/Containers/com.yourname.GlassOTP",
    "~/Library/LaunchAgents/com.glassotp.loginitem.plist",
  ]
end
