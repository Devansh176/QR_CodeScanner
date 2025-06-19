# 📱 QR Code Scanner – Flutter App

A simple and effective **QR code scanner** built using **Flutter**. This app utilizes the device's camera to scan and decode QR codes instantly, making it suitable for lightweight scanning needs, such as event check-ins, ID verification, or link decoding.

---

## 🎯 Features

- 📷 Real-time QR code scanning using device camera
- ⚡ Fast and lightweight with smooth UI
- 🧩 Built with modular Dart code
- ✅ Platform support for Android, iOS, web, and desktop (if required)

---

## 📁 Project Structure

```
.
├── lib/
│   ├── main.dart           # App entry point
│   ├── front_Page.dart     # Home or landing screen
│   └── Scan_Qr.dart        # QR scanner logic and UI
├── android/                # Android-specific code
├── ios/                    # iOS-specific code
├── web/                    # Web support
├── linux/                  # Linux support
├── macos/                  # macOS support
├── windows/                # Windows support
├── test/                   # Unit tests
├── pubspec.yaml            # Dependencies
├── analysis_options.yaml   # Linter config
└── .gitignore
```

---

## 🚀 Getting Started

### ✅ Prerequisites

- Flutter SDK installed
- Physical device or emulator
- Camera permissions enabled

### 🔧 Setup Instructions

```bash
# 1. Clone the repository
git clone https://github.com/Devansh176/QR_CodeScanner.git
cd qr_code_scanner_flutter

# 2. Install dependencies
flutter pub get

# 3. Run the app
flutter run
```

---

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  qr_code_scanner: ^1.0.1    # Or the latest version
```

---

## 🔐 Permissions

Ensure the following permission is added in `AndroidManifest.xml`:

```xml
<uses-permission android:name="android.permission.CAMERA"/>
```

## 📷 Usage

- Launch the app.
- Navigate to the QR scan screen.
- Point your device's camera at a QR code.
- The scanner will automatically decode and display the result.

---

## 👨‍💻 Author

**Devansh Dhopte**  
A hands-on project to learn QR scanning integration using Flutter and camera APIs.

---

> _"Scan smarter, faster, and simpler with Flutter-powered QR detection."_  
