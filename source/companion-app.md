---
layout: default
title: iTerm2 - macOS Terminal Replacement
active-state: index
---

### iTerm2 Companion App
**iTerm2 Buddy** is the companion app for your iPhone. Once paired with iTerm2 on your Mac, it lets your phone work together with your terminal.

You can download iTerm2 Buddy from the iOS App Store. Scan this code with your iPhone or iPad:

<img src="/images/companion-qrcode.png">

#### How to Pair
1. On your Mac, open iTerm2 and choose **iTerm2 &gt; Companion Device Settings…**.
2. Make sure the iTerm2 Companion plugin is installed and that “Allow companion device pairing” is turned on. As a security measure to prevent unauthorized users from linking their device to your computer, you'll need to enter an administrator password to enable this.
3. Click **Download Plugin**. This takes you to the download page in your web browser.
4. Download the plugin from the web browser and then extract the zip file.
5. Click **Show QR Code** and authenticate with Touch ID or your password. iTerm2 will then show a QR code.
6. On your iPhone, open **iTerm2 Buddy**, tap **Scan**, and point the camera at the QR code.
7. Confirm the 6-digit code shown on your phone in iTerm2 to finish pairing.

#### Security
Since your terminal's contents are highly sensitive, security is a top priority for communication between iTerm2 and the companion app. End-to-end encryption using Noise protocol ensures that only your Mac and your iPhone can see the content that is shared with the companion app. For details, see the [relay design document](companion-relay-design.html).

Enterprise administrators can prevent usage of the companion by blocking installation of the plugin, which is a Mac app with bundle ID `com.googlecode.iterm2.iTermCompanion`.

#### Beta version
1. On your iPhone, install Apple’s <a href="https://apps.apple.com/app/testflight/id899247664">TestFlight</a> app from the App Store, if you don’t already have it.
2. Open the iTerm2 Buddy beta invitation: <a href="https://testflight.apple.com/join/hMsVghmx">Join the iTerm2 Buddy beta</a>. (Open this link on your iPhone, not your Mac.)
3. In TestFlight, tap **Accept**, then **Install**, to put iTerm2 Buddy on your phone.

