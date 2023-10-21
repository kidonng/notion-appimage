# Notion AppImage

**THIS IS AN UNOFFICIAL REPACK, USE AT YOUR OWN RISK**

Build the [Notion desktop app](https://www.notion.so/desktop) as [AppImage](https://appimage.org/) using [electron-builder](https://www.electron.build/).

**Status: MVP**. Usable but likely needs patching to be decent looking (in Notion sense).

## Build

Prepare dependencies:

- 7z
- Node & npm
- Standard unix tools

Then run [`build.sh`](build.sh).

## Q&A

### Why this over the web version?

Aside from the usual sayings like avoiding the distraction of browsers, [Notion's desktop app uses SQLite and makes the page load faster](https://www.notion.so/blog/faster-page-load-navigation).

### Why AppImage?

I would rather use the web version than other solutions. That said, I'm also planning to package Notion for Arch Linux (AUR).

### Why this instead of [notion-enhancer](https://github.com/notion-enhancer/notion-repackaged)?

notion-enhancer's development is snailing and last release was almost two years ago, at the end of 2021. There are several showstoppers even if you use the vanilla repacked version without notion-enhancer.

This project is inspired by notion-enhancer, albeit sharing no code.
