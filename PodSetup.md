# Setup Guide for SimulatorPermisisons

Below are some detailed steps on how to integrate SimulatorPermissions in your project.

## Installing CocoaPods
CocoaPods can be installed by running the following command:
```
sudo gem install cocoapods
```
For more information, visit [https://guides.cocoapods.org/using/getting-started.html](https://guides.cocoapods.org/using/getting-started.html)

## Creating a pod file
If you do not have a pod file in your project yet, you can get started by executing the following command:
```pod init```

## Adding the library to the pod file. 
Once your Podfile is generated, you will see something like this:

```ruby
# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'MyApp' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for TestApp

  target 'MyAppTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'MyAppUITests' do
    # Pods for testing
  end

end
```

We have quite a few targets here. The first one is the main app (MyApp) while the other two targets are for our tests. In order to integrate this library in the unit tests, we would modify the second target (MyAppAppTests) block to add `pod "SimulatorPermissions"`  right under `#Pods for testing`. It would look like the following:

```ruby
  target 'MyAppTests' do
    inherit! :search_paths
    # Pods for testing
    pod "SimulatorPermissions"
    
  end
  ```
## Installing
When the ```pod "SimulatorPermissions"``` statement has been added to one of your targets in the Podfile, run `pod install`  and wait for the command to complete. 

Congratulations! You now have the pod installed in your project. Be sure to open up the .xcworkspace file from now on. The .xcodeproj file cannot recognize the pods.
