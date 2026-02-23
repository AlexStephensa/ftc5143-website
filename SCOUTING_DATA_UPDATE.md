# Scouting Data Update Guide

This guide explains how to update your team's scouting statistics and videos throughout the competition day without editing code.

## Quick Start

All data is stored in a single JSON file: `assets/data/scouting_data.json`

Simply edit this file and refresh your browser to see the changes!

## File Structure

The JSON file contains four main sections:

### 1. Auto Description
The paragraph describing your autonomous routine.

```json
"autoDescription": "Starting position: Center stage. The robot drives forward to score..."
```

### 2. Auto Videos
A list of video options for different starting positions and alliances:

```json
"autoVideos": [
  {
    "name": "Close Red",
    "path": "assets/videos/auto_close_red.mp4"
  },
  {
    "name": "Close Blue",
    "path": "assets/videos/close_blue.mp4"
  }
]
```

#### Video Path Options:
- **Local Files**: `"assets/videos/filename.mp4"` (place videos in `assets/videos/` folder)
- **Online URLs**: `"https://example.com/video.mp4"` (YouTube, Google Drive, etc.)

### 3. Default Video
Which video should display first when the page loads:

```json
"defaultVideo": "Close Blue"
```

### 4. Teleop Stats
Your team's performance statistics displayed in a table:

```json
"teleopStats": [
  {
    "label": "Avg Cycles",
    "value": "7.4"
  },
  {
    "label": "High Goals",
    "value": "28"
  }
]
```

### 5. Last Updated
Timestamp of when data was last modified (updates automatically when you refresh):

```json
"lastUpdated": "2026-02-20T14:30:00Z"
```

## How to Update

### Updating Text Data

1. Open `assets/data/scouting_data.json`
2. Edit the relevant field (description, stat values, etc.)
3. Save the file
4. Go to the browser and click the **refresh button** (⟲) on the Scouting page
5. Data updates instantly!

### Updating Videos

#### Option 1: Add Local Videos (Recommended for Offline)
1. Add your video file to the `assets/videos/` folder
2. Update `scouting_data.json` with the video name and path:
   ```json
   {
     "name": "Far Blue",
     "path": "assets/videos/auto_far_blue.mp4"
   }
   ```
3. Save both files
4. Rebuild the app

#### Option 2: Use Online URLs (Recommended for Easy Updates)
1. Upload videos to Google Drive, YouTube, or another cloud storage
2. Get the shareable link (make sure it's accessible without authentication)
3. Update the path in `scouting_data.json`:
   ```json
   {
     "name": "Close Red",
     "path": "https://your-cloud-storage-url/video.mp4"
   }
   ```
4. Save and refresh

## Example Complete File

```json
{
  "autoDescription": "Starting position: Center stage. The robot drives forward to score in the high goal, then backs up and collects a second piece before returning to score. Reliable 2-point auto sequence.",
  "autoVideos": [
    {
      "name": "Close Red",
      "path": "assets/videos/auto_close_red.mp4"
    },
    {
      "name": "Close Blue",
      "path": "assets/videos/close_blue.mp4"
    },
    {
      "name": "Far Red",
      "path": "assets/videos/auto_far_red.mp4"
    },
    {
      "name": "Far Blue",
      "path": "assets/videos/auto_far_blue.mp4"
    }
  ],
  "defaultVideo": "Close Blue",
  "teleopStats": [
    {
      "label": "Avg Cycles",
      "value": "7.4"
    },
    {
      "label": "High Goals",
      "value": "28"
    },
    {
      "label": "Low Goals",
      "value": "12"
    },
    {
      "label": "Penalties",
      "value": "2"
    },
    {
      "label": "Avg Match Score",
      "value": "94.5"
    }
  ],
  "lastUpdated": "2026-02-20T14:30:00Z"
}
```

## Common Tasks

### Update After Each Match
1. Open `scouting_data.json`
2. Update stat values based on your team's performance
3. Save the file
4. On the website, click the refresh button to see updates

### Change Default Video
Edit the `defaultVideo` field to match one of your video names exactly:
```json
"defaultVideo": "Close Red"
```

### Add New Video
1. Add a new object to the `autoVideos` array:
   ```json
   {
     "name": "Your Video Name",
     "path": "path/to/video.mp4"
   }
   ```
2. You can now select it from the dropdown

### Update Match Statistics
Find the stats in `teleopStats` and update the `value` field:
```json
{
  "label": "High Goals",
  "value": "28"  // Change this number
}
```

## Tips for Success

✅ **Keep JSON valid** - Make sure all quotes and commas are correct
✅ **Use consistent naming** - Match video names exactly in `defaultVideo`
✅ **Test before matches** - Make sure refresh works before competition day
✅ **Cloud storage for videos** - Easier to update without rebuilding
✅ **Update timestamps** - Edit `lastUpdated` to show when info was updated

## Troubleshooting

**Videos not loading?**
- Check the file path is correct
- Ensure video files exist in the folder
- For online videos, make sure the link is accessible

**Changes not showing?**
- Click the refresh button (⟲) on the page
- Check your browser console for errors (F12 → Console)
- Make sure JSON is valid (no syntax errors)

**JSON validation errors?**
- Use an online JSON validator: https://jsonlint.com
- Check for missing commas or quotes
- Make sure all brackets match

## File Organization

```
ftc5143-website/
├── assets/
│   ├── data/
│   │   └── scouting_data.json     ← Edit this file
│   ├── images/
│   └── videos/
│       ├── auto_close_red.mp4
│       ├── close_blue.mp4
│       ├── auto_far_red.mp4
│       └── auto_far_blue.mp4
└── ...
```

## Need Help?

If you encounter issues:
1. Check if the JSON file is valid (use jsonlint.com)
2. Verify file paths are correct
3. Clear your browser cache (Ctrl+Shift+Delete)
4. Try a hard refresh (Ctrl+Shift+R)

Happy scouting! 🤖

