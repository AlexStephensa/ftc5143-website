# FTC Team 5143 Website

A Flutter web application for FIRST Tech Challenge Team 5143.

## 🎉 Quick Start

```powershell
# Clone and setup
cd C:\dev\projects\flutter\ftc5143-website
flutter pub get

# Run in development
flutter run -d chrome

# Build for production
flutter build web --release
```

## 📚 Documentation

- **[DEVELOPMENT-GUIDE.md](./DEVELOPMENT-GUIDE.md)** - How to develop and fix common issues
- **[README-DEPLOYMENT.md](./README-DEPLOYMENT.md)** - How to deploy to the web

## ⚠️ Important: Hot Reload Issue

**If you see "AssetManifest.bin.json not found" errors:**
1. Stop Flutter (Ctrl+C)
2. Restart: `flutter run -d chrome`
3. Or press `R` (capital R) instead of `r` when making changes

Hot reload (`r`) doesn't work well with Flutter web assets. Use hot restart (`R`) instead.

## 🖼️ Features

- ✅ Responsive navigation bar
- ✅ Home page with team info
- ✅ About page
- ✅ Contact page
- ✅ Scouting view
- ✅ Team images and branding

## 🛠️ All Issues Fixed

1. ✅ Navigation bar const errors
2. ✅ Layout infinite width constraints
3. ✅ Asset loading (requires restart, not hot reload)

## 🚀 Ready to Deploy?

See **[README-DEPLOYMENT.md](./README-DEPLOYMENT.md)** for:
- Firebase Hosting
- GitHub Pages
- Netlify
- Custom domains

## 📱 Pages

- **Home** - Team introduction and scouting widget
- **About** - Team information
- **Contact** - Contact details
- **Scouting** - Scouting data view

## 🎨 Tech Stack

- Flutter (Web)
- Go Router for navigation
- Responsive design
- Material Design 3

## 📞 Support

- Flutter Docs: https://docs.flutter.dev
- Firebase: https://firebase.google.com/docs/hosting
- Netlify: https://docs.netlify.com

---

**Built with ❤️ by FTC Team 5143**
