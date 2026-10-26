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
