---
layout: default
title: iTerm2 Buddy Privacy Policy
active-state: index
---

### iTerm2 Buddy Privacy Policy

Effective date: August 17, 2026

iTerm2 Buddy is the companion app for iTerm2. After you pair it with iTerm2 on your Mac, it lets your iPhone or iPad view and control your iTerm2 terminal sessions and chat with an AI assistant that runs on your Mac. This policy explains what the app does and does not do with your information.

#### The short version
- The app has no account, no login, and no advertising.
- We do not track you, and we do not sell or share your personal information.
- Content shared between your Mac and your phone is end-to-end encrypted, so only your own devices can read it.
- The only information kept on our servers is what is strictly needed to deliver push notifications and to route encrypted traffic.

#### Terminal content and messages
The terminal output, keystrokes, and chat messages exchanged between your Mac and your phone are end-to-end encrypted using the Noise protocol. They are readable only by your paired Mac and your paired device. Our relay servers forward this traffic as encrypted bytes; they cannot read it and do not store it. See the <a href="companion-relay-design.html">relay design document</a> for details.

#### Push notifications
To send you notifications (for example, when the assistant replies or needs your approval), the app registers with Apple’s Push Notification service and provides your device’s push token to our relay. We store that token solely to deliver notifications to your device, and remove it when it is no longer valid or when you unpair. The push token is a device-level identifier; it is not linked to your name or any account, and it is never used for tracking or advertising. Notification content is limited to what is needed to inform you and, unlike the terminal content above, is not end-to-end encrypted, so we keep the information included in notifications to a minimum.

#### Network address
Like any internet service, our relay necessarily receives the network (IP) address of the connecting device in order to route traffic. We use it only to deliver the connection in real time and to limit abuse. It is not written to logs and is not retained.

#### Camera
The app uses the camera only to scan the pairing QR code that iTerm2 shows on your Mac. No photos are taken or stored.

#### Microphone and voice dictation
If you use voice dictation, transcription runs entirely on your device. Your audio is processed locally and never leaves your device or is uploaded to us or any third party. The microphone is used only while you are actively dictating.

#### Diagnostic logs
If you turn on diagnostic logging, logs are stored locally on your device to help troubleshoot problems. They are never sent anywhere automatically. They leave your device only if you choose to email or share them, in which case they go only to the destination you select.

#### Information we do not collect
We do not collect analytics or usage statistics, we include no third-party tracking or advertising code, and we do not build a profile of you. Because there is no account, we do not have your name, email address, or a password unless you choose to email us for support.

#### Third parties
- Apple: notifications are delivered through Apple’s Push Notification service, subject to Apple’s privacy policy.
- Relay infrastructure: encrypted traffic and notification delivery pass through relay servers we operate. These servers forward data as described above and are configured not to retain logs. You can also run your own relay.

#### Children
iTerm2 Buddy is a developer tool and is not directed to children under 13, and we do not knowingly collect information from them.

#### Changes to this policy
If this policy changes, we will update the effective date above and post the new version on this page.

#### Contact
Questions about this policy can be sent to <a href="mailto:gnachman@gmail.com">gnachman@gmail.com</a>.
