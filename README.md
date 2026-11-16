# 🇵🇰 Explore Pakistan - Flutter Travel Guide

![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Material 3](https://img.shields.io/badge/Material_3-Enabled-757575?style=for-the-badge&logo=material-design&logoColor=white)
![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS%20%7C%20Web-brightgreen?style=for-the-badge)

**Explore Pakistan** is a comprehensive, visually elegant Flutter application developed for **Assignment 2** of the Mobile Application Development (MAD) course. It acts as a digital travel guide showcasing the majestic landscapes, historical landmarks, and cultural heritage of Pakistan.

This project is architected using clean, modular code principles. It implements advanced Flutter UI concepts including **Sliver-based scrolling**, **Hero animations**, **custom navigation routing**, and **responsive layout constraints** to ensure the app looks stunning on both mobile devices and wide screens (Web/Tablet).

---

## 📱 App Screenshots

*(Upload your app screenshots to your GitHub repo and drag-and-drop the image links here)*
| Splash Screen | Home Screen | List Screen | Detail Screen |
| :---: | :---: | :---: | :---: |
| *[Image]* | *[Image]* | *[Image]* | *[Image]* |

---

## 🎨 Design System & Architecture

The application uses a centralized configuration for its design system to ensure absolute UI consistency across all screens. It strictly follows **Material 3** design guidelines.

### 1. Design Tokens (`lib/shared.dart`)
Instead of hardcoding colors, the app relies on globally defined constants:

| Token | Hex Code | Purpose |
| :--- | :--- | :--- |
| `kPrimary` | `#34483A` | Primary forest green used for AppBars, buttons, and active states. |
| `kDark` | `#26352C` | Darker green used for text and gradient transitions. |
| `kBackground` | `#F4F6F4` | Soft off-white background for main screens. |
| `kSurround` | `#E8ECE8` | Grey surround used by `PageFrame` for Web/Tablet views. |

### 2. Responsive Layout (`lib/page_frame.dart`)
Mobile apps usually stretch awkwardly on web browsers. To fix this, the `PageFrame` widget wraps the app in a `ConstrainedBox` with a `maxWidth: 520`. This forces the app to look like a centered mobile phone screen on larger displays, keeping the UI beautiful.

### 3. Reusable Asset Management (`AssetPhoto` Widget)
Instead of using standard `Image.asset()` everywhere, a custom `AssetPhoto` widget was created in `shared.dart`. It includes an `errorBuilder` that gracefully renders a grey placeholder icon if an image is missing, preventing the dreaded "red screen of death." It also enforces `FilterQuality.high` for sharp rendering.

---

## 🚀 Advanced Flutter Implementations

Here is a deep dive into the specific Flutter techniques used in the codebase:

### 🪄 1. Sliver-Based Scrolling (`CustomScrollView`)
Instead of a standard `Scaffold(appBar:...)`, the Home and Detail screens use a `CustomScrollView`. This allows the `SliverAppBar` to smoothly shrink and collapse into a standard AppBar as the user scrolls up.

### ✨ 2. Fluid Animations
*   **Splash Screen:** Uses an `AnimationController` with `Curves.elasticOut` to create a bouncy scale-up effect for the logo, combined with an `Interval` fade-in.
*   **Smooth Routing:** The transition from Splash to Home uses a custom `PageRouteBuilder` with a 600ms `FadeTransition` instead of the default jarring jump.

### 🦸‍♂️ 3. Hero Animations
When a user taps a destination in the `ListView`, the image seamlessly "flies" to the Detail Screen. This is achieved by wrapping both images in a `Hero` widget with a shared, unique tag.

---

## 🧭 Navigation Flow & State Management

The app uses standard `Navigator.push` and `Navigator.pop` combined with a highly optimized custom Drawer.

### Drawer Routing Logic (`lib/app_drawer.dart`)
The custom drawer handles routing intelligently to prevent the navigation stack from growing infinitely (which causes memory leaks).
1. User taps a drawer item.
2. `Navigator.pop(context)` closes the drawer.
3. `Navigator.popUntil((route) => route.isFirst)` clears the stack back to the Home screen.
4. `Navigator.push()` opens the new screen.

```mermaid
graph TD
    A[Splash Screen] -->|Timer 3s + Fade| B(Home Screen)
    B -->|Navigator.push| C(List Screen)
    B -->|Navigator.push| D(About Screen)
    C -->|Navigator.push| E(Detail Screen)
    E -->|Navigator.pop| C
    C -->|Drawer -> PopUntil isFirst| B