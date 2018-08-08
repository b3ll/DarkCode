# DarkCode

A Plugin to Force Xcode to use Dark Mode.

![DarkCode Screenshot](/ScreenShot@2x.png?raw=true "DarkCode Screenshot")

## Intro

This plugin forces Xcode to use macOS Mojave's Dark Mode (regardless of what the system appearance is). I personally like just using Xcode and media apps with a dark appearance with everything else (Finder, Messages, Safari, etc.) with a light appearance.

I found a slightly simpler hack earlier (https://twitter.com/b3ll/status/1026949157456629762) however at the time of posting that would cause the menubar to be black but all the icons in it to be also black, which was kinda lame. This hack is also pretty much thrown together and hasn't been well tested, so ymmv. Use it at your own risk!

This may probably break in the future, so this plugin is targeting Mojave beta 5+ (as well as Xcode 10 beta 5+).

## How do I DarkCode?

### Xcode Plugin

If you disable SIP (I think this is needed) and AppleMobileFileIntegrity you can load it as an xcplugin by building the DarkDock-xcplugin target (with codesigning enabled) and placing the plugin in:

`~/Library/Application Support/Developer/Shared/Xcode/Plug-ins/`

### SIMBL

Mojave + SIMBL support isn't really a thing right now, I think it's being worked on. I just used [mach_inject](https://github.com/rentzsch/mach_inject) to inject it.
[MacPlus](https://github.com/w0lfschild/MacPlus) also seems to be a successor that's actively being worked on (and that also uses mach_inject).

If you can get SIMBL running, just copy the built bundle to:

`/Library/Application Support/SIMBL/Plugins`

**Note**: You'll also need to disable SIP and AppleMobileFileIntegrity for this to work (since Xcode uses Library Validation).

## License?

Pretty much the BSD license, just don't repackage it and call it your own please!

Also if you do make some changes, feel free to make a pull request and help make things more awesome!

## Contact Info?

Feel free to follow me on twitter: [@b3ll](twitter.com/b3ll)!
