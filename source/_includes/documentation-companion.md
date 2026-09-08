iTerm2 Buddy is an iOS app that pairs with your Mac so you can interact with iTerm2 from your phone. Once paired, you can carry on an [AI chat](documentation-ai-chat.html) and receive terminal alerts on your iPhone, even when the two devices are on different networks.

## Pairing

To pair a device, choose **iTerm2 > Companion Device Settings**. The first time you set this up, iTerm2 opens a guided wizard, **Set Up a Companion Device**, that walks you through the whole process:

1. It installs the AI and companion plugins and turns on both features. (After this, iTerm2 can send data off the Mac, but only with your explicit consent.)
2. It takes your AI provider and API key.
3. It helps you install iTerm2 Buddy on your iPhone.
4. It shows a pairing QR code. On your phone, open iTerm2 Buddy, tap Scan, and point the camera at the code.
5. It asks you to confirm a 6-digit code shown on your phone, which verifies that you are pairing with your own device.

Once you have paired before, choosing **Companion Device Settings** opens the settings window directly instead of the wizard.

Paired devices connect through a relay, so they can reach each other even when the Mac and phone are on different networks. The connection is end-to-end encrypted over a Noise channel, so your data is visible only to your own devices and not to the relay.

## Push Notifications

The Companion app can receive push notifications for terminal alerts. To enable this for a profile, open **Settings > Profiles > Terminal**, click **Filter Alerts**, and turn on **Send alerts to paired iPhone**. With this on, the profile's "alert on next mark" and Post Notification triggers also notify your phone. See [Terminal profile settings](documentation-preferences-profiles-terminal.html) for the alert options this filters.

These pushes are content-free: the notification that travels through the relay and Apple's servers carries no message text. Instead, it wakes the phone, which then fetches the alert text over the encrypted Noise channel. As a result, neither the relay nor Apple sees the content of your alerts.

## Live Session Video

The Companion app can show a live video feed of a session. The feed's bitrate scales with the window's resolution, so quality tracks the size of the window rather than being pinned to a fixed rate.

## Muting

You can mute a chat from iTerm2 Buddy. A muted chat sends no push notifications, and its messages are withheld from the phone, until you unmute it.
