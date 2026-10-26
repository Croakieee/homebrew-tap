cask "glassotp" do
  version "1.3.1"
  sha256 "739a1185c2508b07ed06dbc513ed1ddd310c49a51fe8f436ef4f235901c98bbe"

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
