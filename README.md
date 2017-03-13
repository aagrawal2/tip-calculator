# Pre-work - *tippo*

**tippo** is a tip calculator application for iOS.

Submitted by: **Ankur Agrawal**

Time spent: **8** hours spent in total

## User Stories

The following **required** functionality is complete:

* [ ] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [ ] Settings page to change the default tip percentage.

The following **optional** features are implemented:

* [ ] UI animations 
* [ ] Remembering the bill amount across app restarts (if <10mins)
* [ ] Using locale-specific currency and currency thousands separators.
* [ ] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='http://imgur.com/9voPmL8.gif' title='Tip Calculator' width='' alt='tippo' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

* [ ] The youtube video in the documentation uses 'Xcode 7.0' & 'Deployment target 9.3'. As a new bee I ended up installing latest Xcode 8.x, when I followed the video I realized Xcode and Swift version does make difference. To make it seamless experience for a new user, I think it would be nice if we can ask user to setup the same versions of softwares which is followed by the video.  
* [ ] With Xcode 8.0 - It was a bit of challenge to trigger a function when tip percentage changes in segment control.
In other words use of 'Connect action' siege from segment control to a @IBAction func is not straighforward. By default the func is deifned with 'sender:Any' parameter and it took soemtime to figure out that with Xcode8 it should be 'sender:AnyObject' parameter and then only I can use 'Connect action' siege.  
* [ ] NSUserDefaults mentioned in the documentation mentions use like "let defaults = NSUserDefaults.standardUserDefaults()" while in Swift3 looks like we can't instantiate like this. I gotta use like this "UserDefaults.standard.register(defaults: ["defaultIndex" : defaultIndex])"

## License

    Copyright [yyyy] [name of copyright owner]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
