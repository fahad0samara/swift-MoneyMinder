

## Currency Tracker

Currency Tracker is a powerful and user-friendly app designed to keep you informed about the latest currency exchange rates from around the world. Built using the Model-View-ViewModel (MVVM) architecture pattern, Currency Tracker offers a seamless and intuitive experience for users.

### Key Features:

- **Real-time Exchange Rates:** Stay updated with the most recent currency exchange rates, sourced from reliable APIs.
  
- **User-Friendly Interface:** Navigate the app effortlessly with its clean and intuitive design, optimized for both beginners and experienced users.
  
- **Favorites Management:** Customize your experience by selecting and tracking your favorite currencies for quick access.
  
- **Pull-to-Refresh:** Keep your currency data up-to-date with the convenient pull-to-refresh functionality.
  
- **Detailed Currency Information:** Dive deeper into each currency with comprehensive details including symbols, names, and exchange rates.

  ### Screenshots:
| Get Started | Currency Detail | Home Screen| Some View |
|-------------|-----------------|-------------|-----------|
| ![Home Screen](https://github.com/fahad0samara/swift-MoneyMinder/assets/90055525/19ce3c49-3944-4a1e-a486-7fcfa6da62ef)   | ![Get Started](https://github.com/fahad0samara/swift-MoneyMinder/assets/90055525/7c8c2fb0-eaf7-4696-b845-5d99c27f2c1b) | ![Some View](https://github.com/fahad0samara/swift-MoneyMinder/assets/90055525/fb7906f6-72b1-4318-b4bd-5a14db6acbc4) | ![Currency Detail](https://github.com/fahad0samara/swift-MoneyMinder/assets/90055525/7fc2fe11-74ad-47f7-9fc2-59190fb262ce)

### MVVM Architecture:

Currency Tracker follows the MVVM architecture pattern, which separates the application into three layers:

1. **Model:** Represents the data and business logic of the application. In Currency Tracker, the Model layer includes data models such as `Currency` and `CurrencyDetail`, as well as networking code for fetching currency data from external APIs.

2. **View:** Represents the UI layer of the application. Views are responsible for presenting data to the user and capturing user interactions. SwiftUI views such as `CurrencyListView` and `CurrencyDetailView` serve as the View layer in Currency Tracker.

3. **ViewModel:** Acts as a mediator between the Model and View layers. ViewModels retrieve data from the Model layer, format it appropriately, and provide it to the View layer for display. In Currency Tracker, the `CurrencyListViewModel` serves as the ViewModel for managing currency data.

### Technologies Used:

- **SwiftUI:** Currency Tracker is built entirely using SwiftUI, Apple's modern declarative UI framework.
  
- **Combine Framework:** Utilizes the Combine framework for handling asynchronous events, such as fetching currency data from external APIs and reacting to user interactions.
  
- **RESTful API Integration:** Fetches currency data from external RESTful APIs, ensuring accurate and up-to-date exchange rates.
  
- **Dependency Injection:** Implements dependency injection to provide testability and maintainability, allowing easy swapping of components during testing.
  
- **Unit Testing:** Includes unit tests to verify the correctness of ViewModel logic and ensure proper behavior under different scenarios.




### Installation:

1. Clone the repository to your local machine.
   
2. Open the project in Xcode.
   
3. Build and run the app on your simulator or device.

### Feedback:

We're continuously improving Currency Tracker and welcome your feedback! If you encounter any issues, have suggestions for new features, or would like to contribute to the project, please feel free to [open an issue](link_to_issues) or submit a pull request on GitHub.

### License:

Currency Tracker is licensed under the [MIT License](link_to_license), which allows for both personal and commercial use with proper attribution. See the LICENSE file for more details.

---

