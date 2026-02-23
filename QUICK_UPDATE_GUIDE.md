# How to Update Scouting Data Throughout the Day

## TL;DR - Quick Update Process

1. **Open this file**: `assets/data/scouting_data.json`
2. **Edit the values** you want to change (stats, description, videos, etc.)
3. **Save the file**
4. **On your website**, click the **refresh button** (⟲) near the top
5. **Done!** Changes appear instantly

## What Can You Update?

### ✅ Stats (Easy - Just Numbers)
- Avg Cycles
- High Goals
- Low Goals
- Penalties
- Match Scores
- Any other stats you track

**How to update:**
```json
{
  "label": "High Goals",
  "value": "28"  ← Change this number
}
```

### ✅ Auto Description (Text)
The paragraph describing your autonomous routine

**How to update:**
```json
"autoDescription": "Your new description here..."
```

### ✅ Videos
Add, remove, or change which videos display

**How to update:**
```json
"autoVideos": [
  {
    "name": "Close Red",           ← This is what shows in dropdown
    "path": "assets/videos/auto_close_red.mp4"  ← Path to video
  }
]
```

### ✅ Default Video
Which video displays when page loads

**How to update:**
```json
"defaultVideo": "Close Blue"  ← Must match a video name exactly
```

## File Location

```
assets/
└── data/
    └── scouting_data.json  ← This file
```

## Example Update Sequence

### Before a match
1. Check predictions for upcoming match positions
2. Update stats with best-case scenarios

### After each match
1. Open `scouting_data.json`
2. Update all stat values with actual performance
3. Save
4. Click refresh on the website
5. Scouts see updated stats instantly!

## Video Options

### Option A: Local Files
- Place videos in `assets/videos/` folder
- Reference them like: `"assets/videos/filename.mp4"`
- Requires app rebuild to add new videos

### Option B: Cloud URLs (BETTER)
- Upload videos to Google Drive, YouTube, etc.
- Get shareable link
- Reference like: `"https://your-url/video.mp4"`
- Can update URLs without rebuilding!

### Option C: Mix Both
- Use local videos for auto (quick access)
- Use cloud videos for other content

## Daily Workflow Example

**9:00 AM - Event Starts**
- Predictions based on practice: High goals estimated at 20

**11:30 AM - First Match Complete**
- Update stats:
```json
"teleopStats": [
  {
    "label": "High Goals",
    "value": "18"  ← Actual from match 1
  }
]
```
- Click refresh
- Scouts see real data

**1:00 PM - After Lunch Matches**
- Update with aggregate stats
```json
"teleopStats": [
  {
    "label": "Avg High Goals",
    "value": "17.5"  ← Average of all matches
  }
]
```
- Click refresh

**Throughout Day**
- Update videos with better recordings
- Adjust descriptions as strategy changes
- Keep stats current every 2-3 matches

## NO CODE EDITING REQUIRED!

You can update everything through that one JSON file. No need to touch any `.dart` files or rebuild the app.

## Validation Tips

✅ All values are valid JSON (https://jsonlint.com)
✅ Commas between items are present
✅ Quotes around text are balanced
✅ Video names in dropdown match `defaultVideo` exactly
✅ File is saved

## Browser Tips

💡 After updating the file, you may need to:
1. Click the refresh button on the website
2. Hard refresh browser (Ctrl+Shift+R) if content doesn't update
3. Clear cache if issues persist (Ctrl+Shift+Delete)

## Common Changes

**Change default video:**
```json
"defaultVideo": "Close Red"  ← Must match video name exactly
```

**Update a stat value:**
```json
{
  "label": "Avg Cycles",
  "value": "7.4"  ← Change number here
}
```

**Add new stat:**
```json
{
  "label": "New Stat Name",
  "value": "value here"
}
```

**Add new video:**
```json
{
  "name": "New Video Name",
  "path": "assets/videos/newvideo.mp4"
}
```

---

**Questions?** Check `SCOUTING_DATA_UPDATE.md` for detailed documentation.

Happy scouting! 🤖

