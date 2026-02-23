# Where to Find Everything

## File Location Quick Reference

### The Main Data File (Edit This!)
```
📁 assets/
   📁 data/
      📄 scouting_data.json  ← YOUR DATA FILE
```

**How to edit:**
- Open with any text editor (Notepad, VS Code, etc.)
- Make changes
- Save the file
- Click refresh on your website

### Code Files (For Reference Only)

```
📁 lib/
   📁 services/
      📄 scouting_data_service.dart  ← Data loading logic
   📁 widgets/
      📁 scouting/
         📄 scouting_widget.dart  ← Display widget
```

### Documentation Files

```
📄 QUICK_UPDATE_GUIDE.md         ← Start here!
📄 SCOUTING_DATA_UPDATE.md       ← Detailed guide
📄 DEPLOYMENT_GUIDE.md           ← Production setup
📄 SYSTEM_OVERVIEW.md            ← How it all works
```

## The One File You Need to Know

### `assets/data/scouting_data.json`

This is the ONLY file you need to edit during competition.

**What's inside:**

```json
{
  "autoDescription": "...",        ← Auto routine description
  "autoVideos": [...],             ← Your videos
  "defaultVideo": "...",           ← Which plays first
  "teleopStats": [...],            ← Your stats table
  "lastUpdated": "..."             ← When it was updated
}
```

## Quick Find Paths

### Windows
- Open Explorer
- Go to: `C:\dev\projects\flutter\ftc5143-website\assets\data\`
- Edit: `scouting_data.json`

### Mac/Linux
- Open Terminal
- Go to: `~/path/to/ftc5143-website/assets/data/`
- Edit: `scouting_data.json`

### VS Code
```
File → Open Folder → Select ftc5143-website
Go to assets/data/scouting_data.json
```

## What Each Section Does

### 1. Auto Description
```json
"autoDescription": "Starting position..."
```
Shows as a paragraph on the Scouting page.

### 2. Auto Videos
```json
"autoVideos": [
  {
    "name": "Close Red",
    "path": "assets/videos/auto_close_red.mp4"
  }
]
```
Videos appear in the dropdown menu.

### 3. Default Video
```json
"defaultVideo": "Close Red"
```
Which video plays when page loads (must match a name exactly).

### 4. Teleop Stats
```json
"teleopStats": [
  {
    "label": "High Goals",
    "value": "28"
  }
]
```
Displays in the stats table.

### 5. Last Updated
```json
"lastUpdated": "2026-02-20T14:30:00Z"
```
Shows when data was last modified.

## How to Navigate to the File

### Method 1: From This Project Root
```
ftc5143-website/
├── assets/
│   └── data/
│       └── scouting_data.json  ← HERE
```

### Method 2: In VS Code
1. Open the folder: `ftc5143-website`
2. Click Explorer (top left)
3. Navigate: assets → data → scouting_data.json
4. Double-click to edit

### Method 3: Command Line
```bash
# Navigate to project
cd ftc5143-website

# Open file in editor
code assets/data/scouting_data.json
```

## File Backup Location

Keep a backup:
```
📁 assets/
   📁 data/
      📄 scouting_data.json
      📄 scouting_data.json.backup  ← Your backup copy
```

Just copy the file and add `.backup` to the name.

## Testing Your Changes

1. **Edit** `assets/data/scouting_data.json`
2. **Save** the file
3. Go to website
4. Click **refresh button** (⟲)
5. See changes instantly!

## If You Get Lost

1. Open file manager
2. Search for: `scouting_data.json`
3. Edit with your preferred text editor
4. Save
5. Refresh website

## Important Notes

⚠️ Make sure to:
- Keep JSON format correct (valid syntax)
- Use quotes around all text
- Include all commas between items
- Don't delete any closing brackets

✅ Tools to validate JSON:
- https://jsonlint.com
- VS Code built-in validator
- Online JSON viewers

## During Competition

**Keep this visible:**
```
ftc5143-website/assets/data/scouting_data.json
↑
EDIT THIS FILE TO UPDATE YOUR WEBSITE
```

**When you need to update:**
1. Open this file
2. Change the numbers/text
3. Save (Ctrl+S)
4. Click website refresh button
5. Done!

## File Sizes

- `scouting_data.json` - About 1KB
- Easy to edit
- Fast to load
- No special software needed

## Edit Anytime

You can edit `scouting_data.json`:
- Before matches
- Between matches
- During matches
- Anytime you want updates!

No need to rebuild or restart anything.

---

**TL;DR: Edit this file → `assets/data/scouting_data.json` → Click refresh** ✨

