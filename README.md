# SFCore [![CI Status](https://travis-ci.org/Vaseltior/SFCore.svg?branch=master)](https://travis-ci.org/Vaseltior/SFCore.svg?branch=master)

The core framework based on different sub-frameworks. 
The main goal of this framework is the following. I'm a bit used to a set a common methods, helper classes, etc...

I wanted to get them in a common place which is easily reusable.

This framework uses the following sub frameworks :

- SFErrors : [https://github.com/Vaseltior/SFErrors](https://github.com/Vaseltior/SFErrors](https://github.com/Vaseltior/SFErrors](https://github.com/Vaseltior/SFErrors)



## Installation

### [Carthage](https://github.com/Carthage/Carthage)

Add the following to your Cartfile (your file named `Cartfile` without extension):

	github "Vaseltior/SFCore"
	
Then run `carthage update`.

Follow the current instructions in [Carthage's README](https://github.com/Carthage/Carthage#adding-frameworks-to-an-application) for an up to date installation instructions.

You'll also need to add `SFErrors.framework` to your project. [SFErrors](https://github.com/Vaseltior/SFErrors) is a dependency of **SFCore**, so you don't need to specify it in your *Cartfile*.