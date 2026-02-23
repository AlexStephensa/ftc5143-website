# 📊 Scouting Data System - Start Here

Welcome! You can now update your scouting statistics and videos throughout the day **without any coding**.

## 🚀 Quick Start (2 Minutes)

1. **Open this file**: `assets/data/scouting_data.json`
2. **Edit the values** (stats, description, videos)
3. **Save the file**
4. **On the website, click the refresh button** (⟲)
5. **Done!** Changes appear instantly

## 📚 Documentation Guide

Choose the guide that matches your need:

### 1️⃣ **For Daily Updates During Competition** 
👉 Read: **`QUICK_UPDATE_GUIDE.md`** (2 min read)
- How to update stats after each match
- Common changes and examples
- Daily workflow tips

### 2️⃣ **For Detailed Setup & Configuration**
👉 Read: **`SCOUTING_DATA_UPDATE.md`** (5-10 min read)
- Full file structure explanation
- Adding/removing stats and videos
- Video hosting options (local vs cloud)
- Troubleshooting guide

### 3️⃣ **For Finding Files**
👉 Read: **`FILE_LOCATIONS.md`** (3 min read)
- Where to find the data file
- How to navigate and edit
- Quick reference paths

### 4️⃣ **For Publishing to the Web**
👉 Read: **`DEPLOYMENT_GUIDE.md`** (5-10 min read)
- How to deploy your website
- Live update strategies during events
- Hosting recommendations
- Production setup

### 5️⃣ **For Understanding How It Works**
👉 Read: **`SYSTEM_OVERVIEW.md`** (5-10 min read)
- How the system is architected
- What files were created
- Technical details
- Feature list

## 🎯 By Role

**👨‍💻 Developer/Tech Lead**
1. `SYSTEM_OVERVIEW.md` - Understand architecture
2. `DEPLOYMENT_GUIDE.md` - Deploy to production
3. `SCOUTING_DATA_UPDATE.md` - Full technical details

**📊 Scout Manager/Coach**
1. `QUICK_UPDATE_GUIDE.md` - Daily updates
2. `FILE_LOCATIONS.md` - Where is the file?
3. `QUICK_UPDATE_GUIDE.md` again - Repeat each match

**📈 Strategy Analyst**
1. `QUICK_UPDATE_GUIDE.md` - Update trends
2. `SCOUTING_DATA_UPDATE.md` - Add custom stats

## 📋 The Core File

**File to edit**: `assets/data/scouting_data.json`

**Contains**:
- ✅ Auto routine description
- ✅ Video selections (up to 4)
- ✅ Teleop statistics (unlimited)
- ✅ Last updated timestamp

**No coding knowledge required**

## ⚡ Common Tasks

### After Each Match
```
1. Open assets/data/scouting_data.json
2. Update stat numbers
3. Save file
4. Click refresh on website
5. Share updated stats with team
```

### Update Default Video
```json
"defaultVideo": "Your Video Name Here"
```

### Add New Stat
```json
{
  "label": "New Stat Name",
  "value": "value here"
}
```

### Change Auto Description
```json
"autoDescription": "Your new description..."
```

### Add Video
```json
{
  "name": "Dropdown Label",
  "path": "assets/videos/filename.mp4"
}
```

## 🔧 System Features

✨ **No Rebuilding** - Update without rebuilding app
✨ **Instant Updates** - Changes appear immediately
✨ **Error Handling** - Helpful messages if something breaks
✨ **Cloud Support** - Host videos anywhere
✨ **Live During Event** - Update while competing
✨ **Easy Rollback** - Just revert file changes
✨ **Team Friendly** - No programming knowledge needed
✨ **Professional** - Updates show on live website

## 📱 Using During Competition

**Setup**:
- Deploy website to production (Vercel/Netlify recommended)
- Have laptop/tablet at scouting area
- Open file for editing
- Have browser open to website

**Workflow**:
1. Scouting finishes match
2. You open JSON file
3. Edit stats based on scout report
4. Save file
5. Hit refresh on website
6. Team sees updated stats in real-time

## 🌐 Hosting Recommendations

**Best for Easy Updates**: 
- Vercel (FREE) - https://vercel.com
- Netlify (FREE) - https://netlify.com

**Why**:
- Auto-deploy on file changes
- Can edit files through web interface
- Free tier works great
- No server maintenance needed

## 📞 Troubleshooting

**Changes not showing?**
- Click refresh button on website
- Hard refresh browser (Ctrl+Shift+R)
- Check JSON is valid (jsonlint.com)

**Video not loading?**
- Verify file path is correct
- For URLs: make sure link is accessible
- Check file exists in assets/videos/

**JSON error?**
- Use https://jsonlint.com to validate
- Check all quotes and commas match
- Make sure no special characters in values

## 📚 Reading Order

**First Time Setup**:
1. FILE_LOCATIONS.md - Find the data file
2. QUICK_UPDATE_GUIDE.md - Learn basic updates
3. Open and edit the JSON file

**Before Competition**:
1. DEPLOYMENT_GUIDE.md - Get it online
2. QUICK_UPDATE_GUIDE.md - Review process
3. Test updates work

**During Competition**:
1. Have FILE_LOCATIONS.md handy
2. Use QUICK_UPDATE_GUIDE.md as reference
3. Edit JSON, click refresh, repeat

## 🎓 Learning Path

```
START
  ↓
Read QUICK_UPDATE_GUIDE.md (2 min)
  ↓
Edit scouting_data.json (5 min)
  ↓
Click refresh on website (1 sec)
  ↓
See changes! 🎉
```

## ✅ Checklist Before Event

- [ ] Read QUICK_UPDATE_GUIDE.md
- [ ] Located scouting_data.json file
- [ ] Tested editing and refreshing
- [ ] Have laptop at competition
- [ ] Website is deployed and working
- [ ] Team knows refresh process
- [ ] Backup of data file saved
- [ ] JSON validation tool bookmarked

## 🎯 You're Ready!

This system is designed to be simple and foolproof:
- No code editing
- No rebuilding
- No special tools
- Just edit a JSON file and refresh

**Start with `QUICK_UPDATE_GUIDE.md` and you're all set!** 🚀

---

## 📖 Complete File List

```
ftc5143-website/
├── 📄 FILE_LOCATIONS.md          ← Where is the data file?
├── 📄 QUICK_UPDATE_GUIDE.md      ← Daily updates (START HERE)
├── 📄 SCOUTING_DATA_UPDATE.md    ← Detailed documentation
├── 📄 DEPLOYMENT_GUIDE.md        ← Going live
├── 📄 SYSTEM_OVERVIEW.md         ← How it works
├── 📄 README.md                  ← Original project README
│
├── assets/
│   └── data/
│       ├── 📄 scouting_data.json ← YOUR DATA FILE
│       └── 📄 scouting_data.json.template
│
└── lib/
    ├── services/
    │   └── scouting_data_service.dart  (auto-loaded)
    └── widgets/scouting/
        └── scouting_widget.dart        (auto-loaded)
```

---

**Questions?** Check the relevant guide above.

**Ready to start?** Open `QUICK_UPDATE_GUIDE.md` now! 📖

Happy scouting! 🤖🏆

