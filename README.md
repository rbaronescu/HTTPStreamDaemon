# 🎧 Simple HTTP Streamer for Legacy iOS
A lightweight HTTP audio streaming daemon for use with **Music Assistant** on older iOS devices.

---

## 📁 Installation

1. **Install the launch daemon plist:**

```sh
cp com.rbaronescu.httpstreamdaemon.plist /Library/LaunchDaemons/
chmod 644 /Library/LaunchDaemons/com.rbaronescu.httpstreamdaemon.plist
```


2. **Ensure the daemon binary is installed to /usr/bin/HTTPStreamDaemon and has correct permissions (e.g. chmod 755)**


## 💡 For automations, these can be used:

**Stop the daemon**

```sh
launchctl unload /Library/LaunchDaemons/com.yourname.streamdaemon.plist
```

**Start the daemon**
```sh
launchctl load /Library/LaunchDaemons/com.yourname.streamdaemon.plist
```

**Since the service has KeepAlive set, killall can be used to force a restart**
```sh
killall HTTPStreamDaemon
```
