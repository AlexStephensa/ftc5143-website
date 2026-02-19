# Deploying Your Flutter Website

## Problems Fixed

### 1. **Navigation Bar Issue**
The navigation bar had missing `const` keywords which could cause performance issues. This has been fixed.

### 2. **Layout Constraint Error**
The scouting widget was using `Flexible` with `BoxConstraints` that created infinite width constraints. This has been fixed by:
- Using `Expanded` instead of `Flexible`
- Removing the dynamic `maxWidth` constraints
- Using flex ratios instead

### 3. **Image Loading Issues**
Images weren't loading due to asset manifest issues during hot reload. This is resolved by doing a full rebuild.

---

## Building for Web

### Step 1: Clean and Get Dependencies
```bash
flutter clean
flutter pub get
```

### Step 2: Build for Web
```bash
flutter build web --release
```

This creates optimized web files in the `build/web` directory.

### Optional: Build with specific renderer
```bash
# For better performance (recommended):
flutter build web --release --web-renderer canvaskit

# For smaller bundle size:
flutter build web --release --web-renderer html
```

---

## Deployment Options

### Option 1: Firebase Hosting (Recommended - Free & Easy)

1. **Install Firebase CLI**
   ```bash
   npm install -g firebase-tools
   ```

2. **Login to Firebase**
   ```bash
   firebase login
   ```

3. **Initialize Firebase in your project**
   ```bash
   firebase init hosting
   ```
   - Select your Firebase project or create a new one
   - Set public directory to: `build/web`
   - Configure as single-page app: `Yes`
   - Don't overwrite index.html: `No`

4. **Deploy**
   ```bash
   flutter build web --release
   firebase deploy --only hosting
   ```

Your site will be live at: `https://your-project-id.web.app`

### Option 2: GitHub Pages (Free)

1. **Create a GitHub repository** for your project

2. **Install gh-pages (if using automated deployment)**
   ```bash
   npm install -g gh-pages
   ```

3. **Build the project**
   ```bash
   flutter build web --release --base-href "/ftc5143-website/"
   ```
   (Replace `ftc5143-website` with your repo name)

4. **Deploy to gh-pages branch**
   ```bash
   cd build/web
   git init
   git add .
   git commit -m "Deploy website"
   git branch -M gh-pages
   git remote add origin https://github.com/YOUR_USERNAME/ftc5143-website.git
   git push -u origin gh-pages --force
   ```

5. **Enable GitHub Pages**
   - Go to your repository settings
   - Navigate to "Pages" section
   - Set source to `gh-pages` branch
   - Save

Your site will be live at: `https://YOUR_USERNAME.github.io/ftc5143-website/`

### Option 3: Netlify (Free, with CI/CD)

1. **Create a `netlify.toml` file** in your project root:
   ```toml
   [build]
     command = "flutter build web --release"
     publish = "build/web"

   [[redirects]]
     from = "/*"
     to = "/index.html"
     status = 200
   ```

2. **Connect to Netlify**
   - Go to [netlify.com](https://netlify.com)
   - Click "Add new site" > "Import an existing project"
   - Connect your Git repository
   - Netlify will auto-detect settings from `netlify.toml`
   - Deploy!

Your site will be live at: `https://your-site-name.netlify.app`

### Option 4: Vercel (Free, with CI/CD)

1. **Create a `vercel.json` file** in your project root:
   ```json
   {
     "buildCommand": "flutter build web --release",
     "outputDirectory": "build/web",
     "routes": [
       { "handle": "filesystem" },
       { "src": "/.*", "dest": "/index.html" }
     ]
   }
   ```

2. **Deploy with Vercel**
   - Install Vercel CLI: `npm install -g vercel`
   - Run: `vercel`
   - Follow the prompts

Or connect via GitHub:
   - Go to [vercel.com](https://vercel.com)
   - Click "Add New Project"
   - Import your Git repository
   - Deploy!

### Option 5: Custom Server (VPS/Cloud)

If you have your own server:

1. **Build the web app**
   ```bash
   flutter build web --release
   ```

2. **Upload the `build/web` directory** to your server

3. **Configure your web server** (e.g., Nginx):
   ```nginx
   server {
       listen 80;
       server_name your-domain.com;
       root /path/to/build/web;
       index index.html;

       location / {
           try_files $uri $uri/ /index.html;
       }
   }
   ```

---

## Testing Locally

Before deploying, test locally:

```bash
# Build
flutter build web --release

# Serve locally (requires Python 3)
cd build/web
python -m http.server 8000

# Or with Node.js http-server
npx http-server build/web -p 8000
```

Visit: `http://localhost:8000`

---

## Performance Optimization Tips

1. **Optimize Images**
   - Compress your images before adding them
   - Use WebP format for better compression
   - Use responsive images

2. **Enable Caching**
   - Configure your hosting to cache static assets
   - Set appropriate cache headers

3. **Use CanvasKit Renderer**
   - Better performance for complex UIs
   - Build with: `flutter build web --web-renderer canvaskit`

4. **Lazy Loading**
   - Consider code splitting for larger apps
   - Load routes on demand

---

## Troubleshooting

### Images Not Loading
- Make sure `pubspec.yaml` has `assets/images/` in the assets section ✓
- Run `flutter clean` and rebuild
- Check image paths are correct (case-sensitive)

### Routing Issues
- Ensure your hosting is configured for single-page applications
- Set up redirects to `index.html` for all routes

### Blank Page
- Check browser console for errors
- Verify the base href is correct for your deployment

---

## Next Steps

1. Choose a hosting provider from the options above
2. Build your website: `flutter build web --release`
3. Deploy using your chosen method
4. Set up a custom domain (optional)
5. Monitor and maintain your site

**Recommended for beginners:** Firebase Hosting or Netlify (both have generous free tiers and easy setup)

