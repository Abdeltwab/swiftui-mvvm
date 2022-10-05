# General Information
 
 - Minimum  Deployment target : `iOS 15.0` 
 - iOS   target : `iOS 15.0` 
 - UI FrameWork :  `SWIFTUI`
 - Design architecture : `Clean Code` + `MVVM` + `Combine`
 - Patterns  : `DI` , `IoC` , `coordinator navigation`
 - Dependencies : 
	 - https://github.com/lorenzofiamingo/swiftui-cached-async-imagee
	 - https://github.com/Swinject/Swinject

# Installation

 - clone the app 
 - resolve package versions
 - run the app on a simulator or phone

# App Structure
 
### NetworkingKit (Data Layer):

Swift Package to handle all networking staff required for the app it has `Module` Group that has a dedicated group for every app module and `Tests` that have some basic testes for the Pacakge 

## swiftui-mvvm (Domain + Presentaion Layers) :

The app Main Module in which there are 2 sub groups: 
 -  Modules : Group for all app features and scenes
 -  Utils : Group for all utiles used by app modules (e.g DIHelper , Extentions )
 -  swiftui-mvvmTests:  that have test for the Main functionliies of the App



