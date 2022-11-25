
# **World Cup Qatar 2022 App**

You can see a video [Here](https://drive.google.com/file/d/1gRWLMOkkXE_vd5VqA8yJ6ozuDbClK4bG/view?usp=drivesdk)

## Screenshots

  Splash screen                 |   Home screen        | Home screen | Finshed Matches screen 
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![photo_2022-11-25_21-15-48](https://user-images.githubusercontent.com/55716560/204043947-9d542ca4-2043-429c-b376-443273020905.jpg)|![photo_2022-11-25_21-15-55](https://user-images.githubusercontent.com/55716560/204043972-cfd1ce77-6662-451f-a9e7-c95a8b5ee6c5.jpg)|![photo_2022-11-25_21-18-21](https://user-images.githubusercontent.com/55716560/204044085-4924cd0b-c17b-400c-aa61-2c66d2653a95.jpg)|![photo_2022-11-25_21-18-48](https://user-images.githubusercontent.com/55716560/204044141-87281015-0d4c-4c94-81a7-4fa565bcd90b.jpg)





  Home screen                 |   Product Details screen        |  Help Screen 
:-------------------------:|:-------------------------:|:-------------------------:

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
This folder containes Network helper , shared Prefereace and Local notifiation.
```
helper 
├── constants.dart
├── routes.dart
└── router.dart
```
