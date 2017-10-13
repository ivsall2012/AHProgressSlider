# AHProgressSlider
## Demo
![](https://github.com/ivsall2012/AHProgressSlider/blob/master/demo.gif)

## Usage
### Creation
You can create it like any other UIView, either by code or through a storyboard or a nib

### Configuration
```Swift
slider.maximumTrackTintColor = UIColor.clear
slider.minimumTrackTintColor = UIColor.red
let thumbImg = UIImage(named: "player-thumb")
slider.setThumbImage(thumbImg, for: .normal)
/// Default is gray.
self.slider.loadedProgressTintColor = UIColor.green
slider.trackHeight = 2.0
slider.value = 0.3
slider.loadedProgress = 0.0
```

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

AHProgressSlider is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "AHProgressSlider"
```

## Author

ivsall2012, ivsall2012@gmail.com

## License

AHProgressSlider is available under the MIT license. See the LICENSE file for more info.
