# idDog

This is a fun application that will fetch an array of dog images from a web service and displays it on screen. There is also a login screen which you should provide a valid email to see dog images.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

Cocoa Pods (https://guides.cocoapods.org/using/getting-started.html)

```
sudo gem install cocoapods
```

### Installing

Clone the repo by executing the command

```
git clone git@github.com:viniciusromani/iddog.git
```

Install dependencies with cocoapods

```
pod install
```

## Architecture

* MVVM for presentation layer in all scenes
* Networking layer created to encapsulate responsabilities. It is split in Request/Response where the last makes use o [Decodable Protocol](https://developer.apple.com/documentation/swift/decodable) to parse server response
* Coordinator Software Pattern for routing inside application
* XIB for layout and some View-Code (specifically on LoadableView Protocol)

## Features

* Login screen where you should provide only a valid email to get logged in
	* If you do not provide a valid email, you should see an alert indicating error
* Dog Images screen where you can see dog pictures 
	* You can sort using sort button. It will sort between a list of available Dogs (current are: "Hound", "Husky" and "Pug")
	* If sort the dog you are already seeing, the application should not fetch again
	* If there is any problem with the API call, you should see an error message below sort button

## Built With

* [Alamofire](https://github.com/Alamofire/Alamofire) - Networking abstration layer
* [Kingfisher](https://github.com/onevcat/Kingfisher) - For image downloading and caching
