# 🇵🇰 Explore Pakistan - Flutter Travel Guide

![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Material 3](https://img.shields.io/badge/Material_3-Enabled-757575?style=for-the-badge&logo=material-design&logoColor=white)
![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS%20%7C%20Web-brightgreen?style=for-the-badge)

**Explore Pakistan** is a comprehensive Flutter application built for **Assignment 2** of the Mobile Application Development (MAD) course. It serves as a digital travel guide showcasing the natural beauty, historical landmarks, and cultural heritage of Pakistan.

The project is architected using clean, modular code principles and implements advanced Flutter UI concepts such as **Sliver-based scrolling**, **Hero animations**, **custom routing**, and **responsive layout constraints**.

---

## 📱 App Screenshots

*(Upload your screenshots to your GitHub repo and drag-and-drop the links here)*
| Splash Screen | Home Screen | List Screen | Detail Screen |
| :---: | :---: | :---: | :---: |
| *[Splash Screen Image]* | *[Home Screen Image]* | *[List Screen Image]* | *[Detail Screen Image]* |

---

## 🏗️ Technical Architecture & Design System

The application uses a centralized configuration for its design system to ensure UI consistency across all screens. It utilizes **Material 3** design guidelines.

### 1. Design Tokens (`lib/shared.dart`)
| Token | Hex Code | Purpose |
| :--- | :--- | :--- |
| `kPrimary` | `#34483A` | Primary forest green used for AppBars, buttons, and accents. |
| `kDark` | `#26352C` | Darker green used for gradients and deep text. |
| `kBackground` | `#F4F6F4` | Soft off-white background for main screens. |
| `kSurround` | `#E8ECE8` | Grey surround for the `PageFrame` web/tablet constraint. |

### 2. Responsive Layout Constraint (`lib/page_frame.dart`)
Instead of letting the app stretch infinitely on Web/Desktop, we implemented a `PageFrame` widget. It uses a `ConstrainedBox` with a `maxWidth: 520` to simulate a mobile phone screen width, centering the app beautifully on larger displays.

---

## 🚀 Core Features & Widget Implementation

Here is a detailed breakdown of the advanced Flutter widgets and techniques used in this project:

| Widget / Technique | Implementation Details | File Location |
| :--- | :--- | :--- |
| **`AnimationController`** | Drives the splash screen logo. Uses `Curves.elasticOut` for a bouncy scale-up and an `Interval` for a smooth fade-in. | `splash_screen.dart` |
| **`CustomScrollView` & `SliverAppBar`** | Implements a collapsing app bar. As the user scrolls down, the 260px image banner smoothly shrinks into a standard AppBar. | `home_screen.dart`, `detail_screen.dart` |
| **`Hero` Animations** | Provides a seamless, magical transition. The image of a destination morphs smoothly from the List view into the Detail view. | `list_screen.dart`, `detail_screen.dart` |
| **`GridView.builder`** | Used in the About screen to render a responsive gallery grid. Uses `SliverGridDelegateWithMaxCrossAxisExtent` for adaptive scaling. | `about_screen.dart` |
| **`ListView.builder`** | Renders a lazy-loaded, highly performant list of 10 travel destinations, complete with custom cards and trailing icons. | `list_screen.dart` |
| **`PageRouteBuilder`** | Used instead of standard `MaterialPageRoute` for the splash screen transition, enabling a custom 600ms `FadeTransition`. | `splash_screen.dart` |
| **Custom Drawer (`AppDrawer`)** | A custom side menu with a gradient header, a floating close button, and active state highlighting using `selectedTileColor`. | `app_drawer.dart` |
| **Stateful UI Handling** | Uses `IndexedStack` concept (via Navigator) and `setState` to manage tab switching and dynamic UI updates in the Drawer. | `app_drawer.dart` |

---

## 🧭 Navigation Flow

The app handles navigation using `Navigator.push` and `Navigator.pop`, alongside a custom drawer routing system.

```text
[Splash Screen] 
      │
      │ (3-second Timer + Fade Transition)
      ▼
[Home Screen] ─────────────────────────────────┐
      │                                        │
      ├── (Navigator.push) ──> [List Screen]   │
      │                             │          │
      │                             ▼          │
      │                      [Detail Screen]   │
      │                                        │
      └── (Navigator.push) ──> [About Screen]  │
                                               │
    (Drawer Navigation)                        │
    ──────────────────                         │
    Drawer -> PopUntil(First Route) ───────────┘