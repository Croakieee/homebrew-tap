cask "glassotp" do
  version "2.0.0"
  sha256 "190ff603589077aaa4610ef656f44147d2343a9bff3734bb1ae5e3000f61d3cc"

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
