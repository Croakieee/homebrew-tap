# homebrew-tap

Homebrew tap for [GlassOTP](https://github.com/Croakieee/GlassOTP).

## Install

```sh
brew install --cask croakieee/tap/glassotp
```

## Update

```sh
brew upgrade --cask glassotp
```

## Uninstall

```sh
brew uninstall --cask glassotp
```

Also remove settings, the token list and the login item:

```sh
brew uninstall --zap --cask glassotp
```

Secrets stay in the Keychain after uninstalling. To delete them, use **Delete All** in GlassOTP first.

## Quarantine

GlassOTP is not notarized. After installation the cask removes the `com.apple.quarantine` attribute from `GlassOTP.app`, which is what `xattr -r -c /Applications/GlassOTP.app` does by hand.

## Publishing a new version

1. Publish a GitHub release tagged `v.X.Y.Z` with `GlassOTP.zip` that contains `GlassOTP/GlassOTP.app`.
2. Run `./update-cask.sh X.Y.Z`.
3. Commit and push.
