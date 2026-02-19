# FTC 5143 Website - Development Guide

## 🚨 Current Issue: Asset Loading During Hot Reload

### What's Happening?
You're seeing these errors:
```
Error while trying to load an asset: Flutter Web engine failed to fetch "assets/AssetManifest.bin.json"
Unable to load asset: "AssetManifest.bin.json"
```

### Why?
Flutter's hot reload (`r` command) doesn't properly rebuild the asset manifest for web apps. This is a known limitation of Flutter web development.

### ✅ Solutions

#### Solution 1: Full Restart (Easiest)
Instead of pressing `r` (hot reload), press `R` (hot restart):
- **Hot Reload (`r`)**: ❌ Doesn't rebuild assets
- **Hot Restart (`R`)**: ✅ Rebuilds everything including assets

Or stop and restart:
```powershell
# Press Ctrl+C to stop
flutter run -d chrome
```

#### Solution 2: Use Profile Mode
Profile mode handles assets better:
```powershell
flutter run -d chrome --profile
```

#### Solution 3: Build and Test Locally
Build the production version and serve it:
```powershell
# Build
flutter build web --release

# Serve locally (choose one)
cd build/web
python -m http.server 8000
# OR
npx http-server . -p 8000

# Visit: http://localhost:8000
```

---

## 🛠️ Development Workflow

### Starting Development
```powershell
cd C:\dev\projects\flutter\ftc5143-website
flutter run -d chrome
```

### Making Changes
1. Edit your files
2. Press `R` (capital R) for hot restart (not `r`)
3. If images still don't load, stop and restart Flutter

### Before Committing
```powershell
# Check for errors
flutter analyze

# Format code
flutter format lib/

# Test build
flutter build web --release
```

---

## 🖼️ Your Images

All images are correctly configured:
- ✅ `assets/images/logo.png`
- ✅ `assets/images/meat_the_team.png`
- ✅ `assets/images/team_photo.png`

They're declared in `pubspec.yaml`:
```yaml
flutter:
  assets:
    - assets/images/
```

---

## 🐛 Common Issues & Fixes

### Issue: "AssetManifest.bin.json not found"
**Fix:** Stop Flutter and restart (don't use hot reload)

### Issue: Images don't load after hot reload
**Fix:** Press `R` for hot restart instead of `r`

### Issue: Changes not showing
**Fix:** 
```powershell
flutter clean
flutter pub get
flutter run -d chrome
```

### Issue: Layout errors with infinite width
**Fix:** Already fixed in `scouting.dart` - no action needed

### Issue: Navigation bar errors
**Fix:** Already fixed in `navagation_bar.dart` - no action needed

---

## 🚀 Ready to Deploy?

### Quick Deploy Commands

#### Firebase Hosting
```powershell
flutter build web --release
firebase deploy --only hosting
```

#### GitHub Pages
```powershell
flutter build web --release --base-href "/REPO-NAME/"
cd build/web
git init
git add .
git commit -m "Deploy"
git branch -M gh-pages
git remote add origin https://github.com/USERNAME/REPO-NAME.git
git push -u origin gh-pages --force
```

#### Netlify
```powershell
flutter build web --release
netlify deploy --prod --dir=build/web
```

See `README-DEPLOYMENT.md` for detailed deployment instructions.

---

## 📝 Quick Reference

### Flutter Commands
```powershell
flutter run -d chrome          # Start development
flutter clean                  # Clean build files
flutter pub get                # Get dependencies
flutter analyze                # Check for errors
flutter build web --release    # Build for production
```

### During Development
- `R` - Hot restart (rebuilds assets) ✅
- `r` - Hot reload (faster but may break assets) ⚠️
- `q` - Quit
- `h` - Help

---

## ✨ All Fixed Issues

1. ✅ Navigation bar const errors - FIXED
2. ✅ Layout infinite width errors - FIXED
3. ✅ Asset loading - Need to use hot restart (`R`)

---

## 🎯 Next Steps

1. **Stop current Flutter session** (Ctrl+C)
2. **Restart Flutter**: `flutter run -d chrome`
3. **When making changes**: Press `R` (not `r`)
4. **To deploy**: See `README-DEPLOYMENT.md`

---

**Your website is ready! Just restart Flutter to see everything working with images loaded! 🎉**

