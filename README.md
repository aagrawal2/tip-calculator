# Pre-work - *tippo*

**tippo** is a tip calculator application for iOS.

Submitted by: **Ankur Agrawal**

Time spent: **4** hours spent in total

## User Stories

The following **required** functionality is complete:

* [ ] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [ ] Settings page to change the default tip percentage.

The following **optional** features are implemented:

The following **additional** features are implemented:


## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='http://imgur.com/XTh4wty.gif' title='Tip Calculator' width='' alt='tippo' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

* [ ] The youtube video in the documentation uses 'Xcode 7.0' & 'Deployment target 9.3'. As a new bee I ended up installing latest Xcode 8.x and so it is not trivial to follow the video as this versioning is not mentioned anywhere and later on found that it does make difference when I implement the same thing using Xcode 8. 
* [ ] With Xcode 8.0 - It was a bit of challenge to trigger a function when tip percentage changes in segment control.
In other words use of 'Connect action' siege from segment control to a @IBAction func is not straighforward. By default the func is deifned with 'sender:Any' parameter and it took soemtime to figure out that with Xcode8 it should be 'sender:AnyObject' parameter and then only I can use 'Connect action' siege.  
* [ ] The app works as expected with iPhone 7Plus only. It's not working as expected with iPhone 5s simulator as shown in video. I am yet to get chance to figure out the root cause. So far I believe it might be coz 'Xcode & deployment target' version difference as explained above.  


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
