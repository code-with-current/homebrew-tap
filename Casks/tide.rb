# Homebrew Cask for Tide.
#
# First-time submission: PR this file to homebrew/homebrew-cask as
# Casks/t/tide.rb (https://github.com/Homebrew/homebrew-cask). Run
# `brew audit --cask tide` and `brew style Casks/t/tide.rb` locally first.
#
# After the cask is merged, subsequent releases are bumped automatically by
# .github/workflows/release-pkgs.yml (`brew bump-cask-pr`).
#
# Markers filled by packaging/render.mjs: VERSION, SHA256_ARM64, SHA256_X64.

cask "tide" do
  version "0.1.4-beta"

  on_arm do
    sha256 "956229c9e300897f467c06c6d4e9b618ff8f9a63ed41edd5611883eeb8bf0a3f"

    url "https://github.com/code-with-current/tide/releases/download/v#{version}/Tide-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "9969527f976ae8d939f36a883e8262c33b4a720fe31347f91b57c25bf7d83110"

    url "https://github.com/code-with-current/tide/releases/download/v#{version}/Tide-#{version}-x64.dmg"
  end

  name "Tide"
  desc "Local-first agentic coding companion"
  homepage "https://tide.codes/"

  # The .app is ad-hoc signed (no Apple Developer ID), so users see an
  # "unidentified developer" prompt on first launch. homebrew passes
  # --no-quarantine by default for casks, which suppresses Gatekeeper.
  depends_on :macos

  app "Tide.app"

  zap trash: [
    "~/Library/Application Support/Tide",
    "~/Library/Application Support/com.tide.code",
    "~/Library/Caches/Tide",
    "~/Library/Caches/com.tide.code",
    "~/Library/Logs/Tide",
    "~/Library/Preferences/com.tide.code.plist",
    "~/Library/Saved Application State/com.tide.code.savedState",
    "~/Library/WebKit/com.tide.code",
  ]
end
