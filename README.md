
# **World Cup Qatar 2022 App**

You can see a video [Here](https://drive.google.com/file/d/1gRWLMOkkXE_vd5VqA8yJ6ozuDbClK4bG/view?usp=drivesdk)

## Screenshots

  Splash screen                 |   Login screen        |  Verify screen with notification | Verify screen 
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
|

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
