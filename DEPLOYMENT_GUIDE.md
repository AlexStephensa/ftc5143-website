# Deployment & Live Update Guide

## For Competition Day

### Before Event Starts

1. **Build and Deploy** your website to production
2. **Verify** the scouting page loads correctly
3. **Test** the refresh button works
4. **Create a workflow** for updating stats between matches

### During Event

#### Live Update Process

Since the app is already deployed, you can update stats **without rebuilding**:

1. **Access the data file on your server/hosting**
   - If hosted on Vercel: Use their file editor or Git
   - If hosted on Netlify: Use their CMS or Git
   - If self-hosted: Use SFTP or web file manager

2. **Edit `assets/data/scouting_data.json`**
   - Update stat values
   - Update video paths if needed
   - Save the file

3. **Website automatically picks up changes**
   - Scouts click refresh button
   - New stats appear instantly
   - No rebuild needed!

#### Option A: Git-Based Updates (Easiest)

```bash
# After each match:
git pull                          # Get latest
nano assets/data/scouting_data.json  # Edit stats
git add assets/data/scouting_data.json
git commit -m "Update stats after match 3"
git push                          # Deploy automatically
```

#### Option B: File Manager Updates

1. Login to your hosting provider's file manager
2. Navigate to `assets/data/scouting_data.json`
3. Edit the file directly
4. Save and refresh the website

#### Option C: Use Google Sheets + Script

Create a Google Sheet with your stats, then use Apps Script to convert it to JSON.

### Hosting Recommendations for Easy Updates

**Vercel** (Recommended)
- Free tier is perfect
- Easy Git integration
- Can edit files directly in UI
- Auto-deploys on push
- https://vercel.com

**Netlify**
- Similar to Vercel
- Good free tier
- Can use CMS for easy edits
- https://netlify.com

**Self-Hosted**
- Full control
- Need FTP/SFTP access
- Can use cPanel file manager
- Requires manual deploy

## Setup for Live Updates

### On Vercel

1. Connect your GitHub repo to Vercel
2. Deploy your project
3. During event, edit `assets/data/scouting_data.json` on GitHub
4. Push to main branch
5. Vercel auto-deploys
6. Website shows new stats

### On Netlify

1. Connect your GitHub repo to Netlify
2. Deploy your project
3. Use Netlify's code editor OR Git workflow
4. Changes automatically deploy

### Manual Deployment

```bash
# Build for web
flutter build web

# Copy assets
cp -r assets build/web/

# Upload build/web/ folder to your server via FTP/SFTP
```

## JSON File Location After Build

When you build for web, the JSON file will be at:
- `build/web/assets/data/scouting_data.json`

Make sure this file is included when deploying!

## Real-Time Update Workflow Example

**Match 1: 9:30 AM**
```
1. Match completes
2. Enter stats in scouting sheet
3. Edit assets/data/scouting_data.json
4. git push or use file editor
5. Website updates (1-2 seconds)
6. Scouts refresh to see new stats
```

**Match 2: 11:00 AM**
- Repeat above process
- Stats accumulate and average

**Match 3: 1:30 PM**
- Update with latest performance
- Adjust strategy notes if needed
- Website always shows current data

## Tips for Success

✅ **Test before event** - Make sure refresh works
✅ **Have backup plan** - Know how to update quickly
✅ **Train your team** - Show scouts how to refresh
✅ **Keep backups** - Save previous versions
✅ **Use version control** - Git makes rollbacks easy
✅ **Monitor performance** - Check website frequently

## Troubleshooting Live Updates

**Changes not appearing?**
1. Make sure JSON is saved
2. Wait 10-30 seconds for deploy
3. Click refresh button on website
4. Hard refresh browser (Ctrl+Shift+R)
5. Check for JSON syntax errors

**Website goes down?**
1. Check hosting status
2. Verify you have free tier limits remaining
3. Rollback last change via Git
4. Contact hosting support

**Files not deploying?**
1. Check build process includes `assets/`
2. Verify file permissions
3. Make sure `pubspec.yaml` lists `assets/data/`
4. Do a clean build

## Advanced: Auto-Update Script

For the most technical teams, you can create a script to:
1. Poll a spreadsheet
2. Convert stats to JSON
3. Auto-update the deployed file

Contact us if you want this setup.

## Final Checklist Before Event

- [ ] Website deployed and working
- [ ] Refresh button tested
- [ ] JSON file in correct location
- [ ] Team trained on update process
- [ ] Backup stats saved locally
- [ ] Test edit of JSON file
- [ ] Git/file editor access verified
- [ ] Network connection confirmed
- [ ] Have laptop/device with internet at pits

## Security Notes

- Keep your hosting credentials secure
- Don't share deployment passwords
- Use strong Git credentials
- Lock down file permissions
- Only allow trusted team members to deploy

---

**You're ready to deploy!** 🚀

For questions, see `QUICK_UPDATE_GUIDE.md` or `SCOUTING_DATA_UPDATE.md`

