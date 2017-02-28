# IDFA

The IDFA (Identifier for Advertisers) is used for tracking with the purpose of displaying personalized advertisments on iOS devices. This app simply displays the IDFA in a text field (so that it can be copied). More information can be found in the [`ASIdentifierManager`](https://developer.apple.com/reference/adsupport/asidentifiermanager) class reference.

You can disable ad tracking (by the means of the IDFA) by enabling "Limit Ad Tracking" via "Settings" → "Privacy" → "Advertising".

**Facts:**

- "Limit Ad Tracking" is disabled by default, meaning tracking is enabled by default (Opt-out).
  *Yes, the formulation is a bit misleading.*
- If "Limit Ad Tracking" is enabled, the IDFA will be `00000000-0000-0000-0000-000000000000` (at least for iOS 10+). This is not true for the iOS Simulator. But the IDFA will be different if the option is toggled.
- If the the "Limit Ad Tracking" opiton is toggled the IDFA changes. This makes current tracking unlinkable to previous tracking (unless other cookies are used for linking both IDFAs).
- The user can reset the IDFA evertime in the iOS settings as described above.
- The IDFA is unique per device.
- The IDFA is the same for all apps on the device.
  *Actually, that is the purpose of the IDFA. Alternatively you can use the [Identifier for Vendors (IDFV)](https://developer.apple.com/reference/uikit/uidevice/1620059-identifierforvendor).*
- The IDFA is reset if the device is reset (see [Privacy implications of IDFA/IDFV?](http://security.stackexchange.com/a/22720/100009), not tested myself).

**Open questions:**

- Is the IDFA reset, if you restore from backup?