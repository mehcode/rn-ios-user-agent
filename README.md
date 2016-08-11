# React Native iOS UserAgent
> Set (and unset) a UserAgent to be used in WebView.

## Install

1. `npm install --save rn-ios-user-agent`

2. `react-native link rn-ios-user-agent`

## Usage

```js
import UserAgentIOS from "rn-ios-user-agent";

// Change user agent for all future web views
UserAgentIOS.set("new user agent");

// Go back to system default user agent
UserAgentIOS.unset();
```
