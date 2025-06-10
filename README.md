# 📰 News App "Insight 360"

## 🌟Overview
- This News App delivers the latest news articles across various categories with a 
  clean, user-friendly interface.

## ✨Features
1. 🎨 Splash View
- 🖼️ Displays app logo and name
- ✨ Smooth animation before login/signup

2. 🔐 Authentication Flow

** 📲 Sign-In View:
- 📧 Name, Email and password fields
- ➡️ "Sign Up" navigation button

** 📝 Sign-Up View:
- 👤 Name, email, and password fields
- ↩️ "Already have an account?" option
- ➡️ "Sign In" navigation button

3. 🏠 Home View
- 📰 Scrollable news feed (list)
- 🖼️ Article image, title, short description
- 🕒 Publication date

4. 📖 News Details View
- 🖼️ Full article with image & text
- 👤 Article Source & publish date
- 🔍 "Preview" button

5. 🔍 Search View
- 🔎 Search bar
- 📋 Filtered results based on category

6. 👤 Profile View
- 📛 Username & email
- 🚪 Logout button

## 🏗️ Architecture
- 🧩 MVVM pattern
- 📡 REST API integration
- 💽 Local caching

```
lib/
│
├── core/
│   ├── utils/                        # App-wide utilities (router, styles, service locator, etc.)
│   ├── widgets/                      # Shared/reusable widgets (loading, error, etc.)
│   └── local_storage/
│       ├── local_storage_cubit/      # Cubit and states for local storage
│       └── local_storage_services/   # SharedPreferences service, keys
│
├── features/
│   ├── auth/
│   │   ├── data/                     # Models, repositories, data sources for authentication
│   │   └── presentation/
│   │       ├── manager/              # Cubits, states for auth
│   │       ├── views/                # Auth screens (sign in, sign up, etc.)
│   │       └── widgets/              # Auth-specific widgets (fields, buttons)
│   │
│   ├── home/
│   │   ├── data/
│   │   │   ├── models/               # News/article models
│   │   │   └── repos/                # Home repo implementations
│   │   └── presentation/
│   │       ├── manager/              # Cubits, states for home
│   │       ├── views/                # Home screen
│   │       └── widgets/              # Home widgets (news item, list, etc.)
│   │
│   ├── news_details/
│   │   ├── data/                     # (Optional) Models, repos for details
│   │   └── presentation/
│   │       ├── views/                # News details screen
│   │       └── widgets/              # News details widgets (e.g., news_details_view_body.dart, news_action.dart)
│   │
│   ├── search/
│   │   ├── data/
│   │   │   └── repos/                # Search repo implementations
│   │   └── presentation/
│   │       ├── manager/              # Cubits, states for search
│   │       ├── views/                # Search screen
│   │       └── widgets/              # Search widgets (search field, result list, etc.)
│   │
│   └── profile/
│       ├── data/                     # (Optional) Models, repos for profile
│       └── presentation/
│           ├── manager/              # Cubits, states for profile
│           ├── views/                # Profile screen
│           └── widgets/              # Profile widgets (avatar, info, etc.)
│
├── injection_container.dart          # Dependency injection setup (get_it)
└── main.dart                         # App entry point

assets/
└── images/                           # App images and icons
```





  





  





  






  

















  
  




  
