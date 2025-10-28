# kobi_pay_interview

# 💳 Kobi Pay Interview — Flutter App

Kobi Pay Interview is a Flutter-based financial dashboard app designed to visualize and manage transactions in a clean, intuitive interface.
The app displays transaction analytics for different accounts or merchants (e.g., Netflix), including detailed breakdowns, summaries, and refund functionality.

## 🧠 Overview

This app provides users with an interactive transaction history interface, where they can:

View their total payments to a merchant.

Visualize spending distribution using a custom pie chart.

Browse through transaction history.

Tap on any transaction card to view details and initiate refunds.

Link to demo:
Demo Video (GIF):  https://drive.google.com/drive/folders/12xyyoGxfasXFOMhpeR_JYOaERwc8JH8i?usp=sharing

## 🖼️ Features

* ✅ Modern UI Design — clean, minimal, and responsive layout.
* ✅ Transaction Analytics — displays total payments and detailed charts.
* ✅ Custom Pie Chart Widget — visually represents spending patterns.
* ✅ Interactive Transaction Cards — tapping opens transaction details.
* ✅ Refund Option — allows users to refund transactions directly from the detail screen.
* ✅ PDF Export — users can export transaction summaries as a PDF.
* ✅ Monthly Filter — quickly switch between months using the dropdown filter.

## 🛠️ API Overview

The app uses mock data randomly generated from `mockapi.io` and fetched via network for demonstration purposes, simulating API responses for transaction history and details. In a production scenario, this would be replaced with real API calls to a backend service.

## 🚀 Preferred State Management: 
### - `Riverpod`

## 📚 Libraries used:

* `fl_chart` // For custom pie chart visualization
* `shared_preferences` // For local data storage
* `intl` // For date and number formatting
* `hooks_riverpod` // For state management
* `shimmer` // For loading animations
* `dio` // For network requests
* `pdf` // For PDF generation
* `printing` // For printing and PDF preview

## 📂 Folder Structure

```
kobi_pay_interview/
│
├── assets/                      # Static assets used in the app
│   └── netflix_logo.png
│
├── fonts
│   ├── open_sans/
│   ├── special_gothic/
│
├── lib/                         # Main source directory
│   ├── data/                    # Data layer: handles models, repositories, and data sources
│   │   ├── models/              # Data models (DTOs)
│   │   │   ├── balance_card.dart
│   │   │   ├── transaction.dart
│   │   │   └── wallet_transaction.dart
│   │   ├── repository/          # (Optional) Data repositories for API/local data abstraction
│   │   └── sealed_classes/      # Sealed class definitions for result/state handling
│   │
│   ├── domain/                  # Domain layer: contains core business logic and entities
│   │
│   ├── presentation/            # Presentation layer: UI and widgets
│   │   ├── transaction_details/
│   │   │   └── transaction_details_page.dart
│   │   └── transaction_summary/ # (Likely UI screens for transaction summary)
│   │
│   ├── widgets/                 # Reusable shared widgets
│   │   ├── app_back_arrow.dart
│   │   └── custom_pie_graph.dart
│   │
│   ├── imports.dart             # Centralized imports for easier access
│   └── main.dart                # App entry point
│
├── android/                     # Android platform code
├── ios/                         # iOS platform code
├── build/                       # Generated build files (ignored in version control)
└── .idea/, .dart_tool/          # IDE and Dart tool configuration
