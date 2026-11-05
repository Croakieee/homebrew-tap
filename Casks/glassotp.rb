cask "glassotp" do
  version "1.3.3"
  sha256 "289304e4ddda17f552271f153485ca3b7092b5c47edb864e13101fba7222c4d9"

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

  uninstall launchctl: "com.glassotp.loginitem",
            quit:      [
              "com.yourname.GlassOTP",
              "io.github.croakieee.GlassOTP",
            ]

  zap trash: [
    "~/Library/Containers/com.yourname.GlassOTP",
    "~/Library/Containers/io.github.croakieee.GlassOTP",
    "~/Library/LaunchAgents/com.glassotp.loginitem.plist",
  ]
end
