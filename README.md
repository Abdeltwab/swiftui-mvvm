# Demo 

## Video

https://drive.google.com/drive/folders/1ZJGZuC5u_R_3enTg9Fe6u8P3e0PPZeX0?usp=sharing

## Screen Shots

<table>
  <tr>
    <td> Main </td>
    <td> Search </td>
    <td> Details </td>
  </tr>
  <tr>
    <td><img src="https://user-images.githubusercontent.com/16858825/194073018-1be49aaa-4432-4226-89a4-2e215333b832.png" width=250 height=520></td>
    <td><img src="https://user-images.githubusercontent.com/16858825/194072994-f83d27f2-7e90-405d-9abb-1beca6d6f874.png" width=250 height=520></td>
    <td><img src="https://user-images.githubusercontent.com/16858825/194072952-8746afaa-63b7-4890-8cfc-26e53ce063f8.png" width=250 height=520></td>
  </tr>
 </table>

# OverView
 
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



