# Homebrew Cask for Tide (published to our own tap,
# code-with-current/homebrew-tap, by .github/workflows/release-pkgs.yml).
#
# Markers filled by packaging/render.mjs: VERSION, SHA256_ARM64, SHA256_X64.

cask "tide" do
  version "0.4.0-beta.2"

  on_arm do
    url "https://github.com/code-with-current/tide/releases/download/v#{version}/tide_v#{version}_mac-aarch64.dmg"
    sha256 "4175dfb53c43763ef077d6bc857489bf2e09dccbb643b6523f1b676a95800dd4"
  end
  on_intel do
    url "https://github.com/code-with-current/tide/releases/download/v#{version}/tide_v#{version}_mac-x64.dmg"
    sha256 "4c10caf3f4d1b4eb695ccdc0afc4a8f9fa0b8a20d7fca27b8c8a6cf52ca303b9"
  end
  name "Tide"
  desc "Local-first agentic coding companion"
  homepage "https://tide.codes/"

  depends_on :macos

  # The .app is ad-hoc signed (no Apple Developer ID), so users see an
  # "unidentified developer" prompt on first launch. homebrew passes
  # --no-quarantine by default for casks, which suppresses Gatekeeper.
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
