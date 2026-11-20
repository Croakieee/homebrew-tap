cask "glassotp" do
  version "2.0.2"
  sha256 "29549ce8469593f1e9a18b7c072f25ddc70d77cb6adf58f1f8090e188bb55339"

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

  app "GlassOTP.app"

  uninstall quit: [
    "com.yourname.GlassOTP",
    "io.github.croakieee.GlassOTP",
  ]

  zap launchctl: "com.glassotp.loginitem",
      trash:     [
        "~/Library/Containers/com.yourname.GlassOTP",
        "~/Library/Containers/io.github.croakieee.GlassOTP",
        "~/Library/LaunchAgents/com.glassotp.loginitem.plist",
      ]
end
