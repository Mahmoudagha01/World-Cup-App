# **World Cup Qatar 2022 App**

## Video

You can see a video [Here](https://drive.google.com/file/d/1gRWLMOkkXE_vd5VqA8yJ6ozuDbClK4bG/view?usp=drivesdk)

## Screenshots

  Splash screen                 |   Home screen        | Home screen | Groups Table screen 
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![photo_2022-11-25_21-15-48](https://user-images.githubusercontent.com/55716560/204043947-9d542ca4-2043-429c-b376-443273020905.jpg)|![photo_2022-11-25_21-15-55](https://user-images.githubusercontent.com/55716560/204043972-cfd1ce77-6662-451f-a9e7-c95a8b5ee6c5.jpg)|![photo_2022-11-25_21-21-28](https://user-images.githubusercontent.com/55716560/204044390-a1b1b0d6-ea1c-4215-905e-8ef87622e3f5.jpg)|![photo_2022-11-25_21-28-03](https://user-images.githubusercontent.com/55716560/204045007-de43e780-3714-4aca-92f3-4643b52f5971.jpg)


  Upcoming Matches Screen screen                 |   Match Stats screen        |  News Details Screen  | Finshed Matches Screen 
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![photo_2022-11-25_21-22-43](https://user-images.githubusercontent.com/55716560/204044464-6813483b-1f8d-4ff7-95be-24295258aec1.jpg)|![photo_2022-11-25_21-25-58](https://user-images.githubusercontent.com/55716560/204044800-6c23da72-4750-4f5c-84e4-35effd33a96e.jpg)|![photo_2022-11-25_21-24-25](https://user-images.githubusercontent.com/55716560/204044636-e5ba1b6b-8d55-49f8-87c0-6bcb12b73ad2.jpg)|![photo_2022-11-25_21-18-48](https://user-images.githubusercontent.com/55716560/204044141-87281015-0d4c-4c94-81a7-4fa565bcd90b.jpg)



 ## Project Structure
```
lib
├── business_logic
├── data
├── presentation
├── helper
└── main.dart
```

### business_logic
This folder containes the business logic of the application specificly state management using BloC Cubit.

```
business_logic
├── Services_cubit
├── News_cubit
├── Upcoming_matches_cubit
└── Glopal_cubit
```

### data
This folder contains all data and operations done to that data
```
data
├── Data Source(API)
├── models
└── repository
```

### presentation
This folder containes everything related to the Ui f the application.
```
presentation
├── views
└── widget
```

### Helper
This folder containes router generator and constants.
```
helper 
├── constants.dart
├── routes.dart
└── router.dart
```
