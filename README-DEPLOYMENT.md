# FTC Team 5143 Website - Issues Fixed & Deployment Guide

## 🎉 Issues Fixed

### 1. Navigation Bar Issues
**Problem:** The navigation bar had missing `const` keywords causing compilation errors.

**Fixed:**
- Added `const` to the title Text in the large screen view
- Made TextStyle const in the `_NavBarItem` widget
- Navigation should now work properly

**Files modified:**
- `lib/widgets/navagation_Bar/navagation_bar.dart`

### 2. Layout Constraint Errors (BoxConstraints forces infinite width)
**Problem:** The scouting widget was using `Flexible` with `BoxConstraints` that created infinite width constraints, causing rendering errors.

**Fixed:**
- Changed `Flexible` to `Expanded` widgets
- Removed dynamic `maxWidth` constraints that were causing infinite width
- Used flex ratios (5:4) to control sizing instead
- Removed unnecessary `Padding` wrapper on one side

**Files modified:**
- `lib/widgets/scouting/scouting.dart`

### 3. Image Loading Issues
**Problem:** Images weren't loading due to asset manifest issues during hot reload.

**Root Cause:** During development with hot reload, Flutter sometimes fails to rebuild the asset manifest properly.

**Solution:** After making fixes, run a full rebuild:
```bash
flutter clean
flutter pub get
flutter build web --release
```

Your assets are correctly configured in `pubspec.yaml`:
```yaml
assets:
  - assets/images/
```

And all three images exist:
- ✅ `assets/images/logo.png`
- ✅ `assets/images/meat_the_team.png`
- ✅ `assets/images/team_photo.png`

---

## 🚀 Quick Start: Deploy Your Website

### Option 1: Firebase Hosting (Easiest, Recommended)

**Setup (one-time):**
```bash
# Install Firebase CLI
npm install -g firebase-tools

# Login to Firebase
firebase login

# Initialize Firebase
firebase init hosting
# - Choose your Firebase project
# - Set public directory to: build/web
# - Configure as single-page app: Yes
# - Don't overwrite index.html: No
```

**Deploy:**
```bash
# Build the website
flutter build web --release

# Deploy to Firebase
firebase deploy --only hosting
```

Your site will be live at: `https://YOUR-PROJECT-ID.web.app`

### Option 2: GitHub Pages (Free, Simple)

1. **Build with base href:**
   ```bash
   flutter build web --release --base-href "/REPO-NAME/"
   ```

2. **Deploy:**
   ```bash
   cd build/web
   git init
   git add .
   git commit -m "Deploy"
   git branch -M gh-pages
   git remote add origin https://github.com/USERNAME/REPO-NAME.git
   git push -u origin gh-pages --force
   ```

3. **Enable GitHub Pages:**
   - Go to repository Settings → Pages
   - Set source to `gh-pages` branch
   - Your site: `https://USERNAME.github.io/REPO-NAME/`

### Option 3: Netlify (Free with CI/CD)

1. **Connect your GitHub repository to Netlify**
2. **Netlify will auto-detect Flutter** and build settings
3. **Done!** Your site deploys automatically on every push

Or use the CLI:
```bash
npm install -g netlify-cli
flutter build web --release
netlify deploy --prod --dir=build/web
```

---

## 📝 Build Commands

### Development Build
```bash
flutter run -d chrome
```

### Production Build
```bash
# Clean and build
flutter clean
flutter pub get
flutter build web --release

# With CanvasKit renderer (better performance)
flutter build web --release --web-renderer canvaskit

# With HTML renderer (smaller size)
flutter build web --release --web-renderer html
```

### Test Locally
```bash
# Build first
flutter build web --release

# Serve with Python
cd build/web
python -m http.server 8000

# Or with Node.js
npx http-server build/web -p 8000

# Visit: http://localhost:8000
```

---

## 🛠️ Using the Build Script

I've created a PowerShell script to automate the build process:

```powershell
.\build-deploy.ps1
```

This will:
1. Clean the project
2. Get dependencies
3. Build for web (release mode with CanvasKit)
4. Show next steps

---

## 📚 Project Structure

```
ftc5143-website/
├── lib/
│   ├── main.dart              # App entry point
│   ├── router.dart            # Route configuration
│   ├── views/                 # Page views
│   │   ├── home/
│   │   ├── about/
│   │   ├── contact/
│   │   └── scouting_view/
│   └── widgets/               # Reusable widgets
│       ├── centered_view/
│       ├── navagation_Bar/    # Navigation bar
│       └── scouting/          # Scouting widget
├── assets/
│   └── images/               # Image assets
├── build/
│   └── web/                  # Built website (after running build)
├── DEPLOYMENT.md             # Detailed deployment guide
└── build-deploy.ps1          # Build automation script
```

---

## 🎯 Recommended Deployment Path

For FTC Team 5143, I recommend:

1. **Start with Firebase Hosting** (easiest, free tier is generous)
2. **Or use Netlify** if you prefer GitHub integration
3. **Add a custom domain** later if needed (both support this)

**Why Firebase/Netlify?**
- ✅ Free hosting
- ✅ Automatic SSL/HTTPS
- ✅ CDN for fast loading worldwide
- ✅ Easy to update (just run deploy command)
- ✅ No server management needed

---

## 🔧 Troubleshooting

### Build fails with "Not a constant expression"
- ✅ Fixed in `navagation_bar.dart`
- Run `flutter clean` and rebuild

### Layout errors with infinite width
- ✅ Fixed in `scouting.dart`
- Run `flutter clean` and rebuild

### Images not loading
- Run `flutter clean && flutter build web --release`
- Check that assets are in `assets/images/` folder
- Verify `pubspec.yaml` includes `assets/images/`

### Routing doesn't work after deployment
- Configure your hosting for single-page apps
- All routes should redirect to `index.html`
- Firebase and Netlify do this automatically

---

## 📞 Support

For detailed deployment instructions, see `DEPLOYMENT.md`

For Flutter help: https://docs.flutter.dev/deployment/web

For Firebase: https://firebase.google.com/docs/hosting

For Netlify: https://docs.netlify.com/

---

## ✅ Checklist Before Deploying

- [x] All code errors fixed
- [x] Build completes successfully: `flutter build web --release`
- [x] Test locally: `http-server build/web`
- [ ] Choose hosting provider (Firebase/Netlify/GitHub Pages)
- [ ] Run build script or manual build
- [ ] Deploy!
- [ ] Test live site
- [ ] Share with your team!

---

**Your website is ready to deploy! Good luck Team 5143! 🤖🚀**

