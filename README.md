# Notion AppImage

![Screenshot](https://i.redd.it/vlp26kemu3wb1.png)

**THIS IS AN UNOFFICIAL REPACK, USE AT YOUR OWN RISK**

Build the [Notion desktop app](https://www.notion.so/desktop) as [AppImage](https://appimage.org/) using [electron-builder](https://www.electron.build/).

> **Status: MVP**. Usable but likely needs patching to be decent looking (in Notion sense).

## Usage

Get the app via [GitHub releases](https://github.com/kidonng/notion-appimage/releases/latest), then launch.

As an AppImage, it requires [FUSE](https://github.com/AppImage/AppImageKit/wiki/FUSE) to run.

---

To create a shortcut in your application menu:

- Edit [`assets/Notion.desktop`](assets/Notion.desktop) to point to the AppImage and copy to `~/.local/share/applications`
- Copy [`assets/notion.png`](assets/notion.png) to `.local/share/icons/hicolor/256x256/apps`

## Build

Prepare dependencies:

- 7zip
- Node.js & npm
- Standard Unix tools

Then run [`build.sh`](build.sh).

## Q&A

### Why this over alternatives (e.g. web version)?

[Please read my Reddit post.](https://www.reddit.com/r/Notion/comments/17f8jhg/notion_desktop_app_on_linux_unofficial/)

### Why AppImage?

I would rather use the web version than other solutions.

If you are on Arch Linux, I recommend [`notion-app-electron`](https://aur.archlinux.org/packages/notion-app-electron) on AUR which is inspired by this repack.

### What about [notion-enhancer](https://github.com/notion-enhancer/notion-repackaged)?

notion-enhancer's development is snailing and last release was almost two years ago, at the end of 2021. There are several showstoppers even if you use the vanilla repacked version without notion-enhancer.

This project is inspired by notion-enhancer, albeit sharing no code.
