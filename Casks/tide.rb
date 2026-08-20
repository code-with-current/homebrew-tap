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
  version "0.2.0-beta.2"

  on_arm do
    sha256 "c65b5f8bc353132848c5c597fa9e377feb047e7b8241e582cba7d80b74e92ce0"

    url "https://github.com/code-with-current/tide/releases/download/v#{version}/Tide-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "94b2ae7610a0377382aaa2db933b15bd16b1e594eea38805f1b54f70a69eaa46"

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
