# Flutter Website Build and Deploy Script
# Run this script to build your website for production

# Clean the project
Write-Host "Cleaning project..." -ForegroundColor Cyan
flutter clean

# Get dependencies
Write-Host "Getting dependencies..." -ForegroundColor Cyan
flutter pub get

# Build for web
Write-Host "Building for web (release mode)..." -ForegroundColor Cyan
flutter build web --release --web-renderer canvaskit

Write-Host ""
Write-Host "Build complete! Your website is ready in the 'build/web' folder." -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "1. Test locally: cd build/web && python -m http.server 8000"
Write-Host "2. Deploy to Firebase: firebase deploy --only hosting"
Write-Host "3. Or upload the 'build/web' folder to your web host"
Write-Host ""
Write-Host "See DEPLOYMENT.md for detailed deployment instructions" -ForegroundColor Cyan

