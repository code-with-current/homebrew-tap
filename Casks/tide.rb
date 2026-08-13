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
  version "0.1.2-beta"

  on_arm do
    sha256 "51c030a168d2d597577aa45da78935fe38a0af97b737b40918f7c0fca7ceedeb"

    url "https://github.com/code-with-current/tide/releases/download/v#{version}/Tide-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "1e5b695e990b1e79b1c3d300b3e6f48434b2539aeb0be7bb10e94808675afbe4"

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
