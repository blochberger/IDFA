# IDFA

The IDFA (Identifier for Advertisers) is used for tracking with the purpose of displaying personalized advertisments on iOS and macOS. This app simply displays the IDFA in a text field (so that it can be copied). More information can be found in the [`ASIdentifierManager`](https://developer.apple.com/reference/adsupport/asidentifiermanager) class reference.

You can disable ad tracking (by the means of the IDFA) by enabling "Limit Ad Tracking" via:

- **iOS**: Settings → Privacy → Advertising

- **macOS**: System Preferences → Security & Privacy → Privacy → Advertising
  Alternatively you can issue the following command:

  ```sh
  defaults write com.apple.AdLib forceLimitAdTracking -bool yes
  defaults write com.apple.AdLib AD_DEVICE_IDFA -string '00000000-0000-0000-0000-000000000000'
  ```

## Terminal (macOS)

The IDFA can be obtained via Terminal on macOS with the following command

```sh
defaults read com.apple.AdLib AD_DEVICE_IDFA
```

To check whether Ad tracking is enabled, use the following command

```sh
defaults read com.apple.AdLib forceLimitAdTracking
```

## Facts

- "Limit Ad Tracking" is disabled by default, meaning tracking is enabled by default (Opt-out).
  *Yes, the formulation is a bit misleading.*

- If "Limit Ad Tracking" is enabled via GUI, the IDFA will be `00000000-0000-0000-0000-000000000000` (at least for iOS 10+ and macOS 10.14+).

  - **iOS Simulator**: The IDFA will change after the option is toggled, but it will not be zeroes only. If "Limit Ad Tracking" is enabled the IDFA changes every time the simulated device is "rebooted".
  - **macOS**: The IDFA will not change and will therefore not be zeroes only on macOS if you only use the command

    ```sh
    defaults write com.apple.AdLib forceLimitAdTracking -bool yes
    ```
    without also setting

    ```sh
    defaults write com.apple.AdLib AD_DEVICE_IDFA -string '00000000-0000-0000-0000-000000000000'
    ```
    not even if you navigate to the GUI option afterwards.

- If the the "Limit Ad Tracking" opiton is toggled the IDFA changes. This makes current tracking unlinkable to previous tracking (unless other cookies are used for linking both IDFAs). This is not true if you only use the command

  ```sh
  defaults write com.apple.AdLib forceLimitAdTracking -bool yes
  ```

- The user can reset the IDFA evertime in the iOS/macOS settings as described above.

- The IDFA is unique per device.

- The IDFA is the same for all apps on the device.
  *Actually, that is the purpose of the IDFA. Alternatively you can use the [Identifier for Vendors (IDFV)](https://developer.apple.com/reference/uikit/uidevice/1620059-identifierforvendor).*

  - **macOS**: Due to a bug, the IDFA is unique per sandbox container and stored in `~/Library/Containers/<bundleId>/Data/Library/Preferences/com.apple.AdLib.plist`. The actual settings configurable by the user are not respected once a container is created, thus defeating the whole purpose of the IDFA.

- The IDFA is reset if the device is reset (see [Privacy implications of IDFA/IDFV?](http://security.stackexchange.com/a/22720/100009)).

- The IDFA is reset if a backup is restored.

- The [`ASIdentifierManager.clearAdvertisingIdentifier()`](https://developer.apple.com/documentation/adsupport/asidentifiermanager/2998811-clearadvertisingidentifier) function creates a new IDFA for the current sandbox container.

<img src="https://github.com/blochberger/IDFA/raw/master/screenshot.png" width="592px" height="250px" alt="Screenshot"/>