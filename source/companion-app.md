---
layout: default
title: iTerm2 - macOS Terminal Replacement
active-state: index
---

### iTerm2 Companion App
**iTerm2 Buddy** is the companion app for your iPhone. Once paired with iTerm2 on your Mac, it lets your phone work together with your terminal.

The app is currently in beta, so it is distributed through Apple’s TestFlight rather than the App Store. Beta builds are free, but they expire periodically and you may be asked to update to a newer build from time to time.

#### How to Install (Beta)
1. On your iPhone, install Apple’s <a href="https://apps.apple.com/app/testflight/id899247664">TestFlight</a> app from the App Store, if you don’t already have it.
2. Open the iTerm2 Buddy beta invitation: <a href="https://testflight.apple.com/join/hMsVghmx">Join the iTerm2 Buddy beta</a>. (Open this link on your iPhone, not your Mac.)
3. In TestFlight, tap **Accept**, then **Install**, to put iTerm2 Buddy on your phone.

#### How to Pair
1. On your Mac, open iTerm2 and choose **iTerm2 &gt; Companion Device Settings…**.
2. Make sure the iTerm2 Companion plugin is installed and that “Allow companion device pairing” is turned on. iTerm2 will show a QR code.
3. On your iPhone, open **iTerm2 Buddy**, tap **Scan**, and point the camera at the QR code.
4. Confirm the 6-digit code shown on your phone in iTerm2 to finish pairing.

If you need the companion plugin for your Mac, see the <a href="companion-plugin.html">iTerm2 Companion Plugin</a> page.

#### Security
Since your terminal's contents are highly sensitive, security is a top priority for communication between iTerm2 and the companion app. End-to-end encryption using Noise protocol ensures that only your Mac and your iPhone can see the content that is shared with the companion app. For details, see the [relay design document](companion-relay-design.html).
