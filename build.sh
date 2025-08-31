mkdir build
pushd build

curl --location https://www.notion.so/desktop/windows/download --output installer

7z e installer \$PLUGINSDIR/app-64.7z
7z x app-64.7z resources/
npx --yes @electron/asar extract resources/app.asar app

sqlite=$(node --print "require('./app/package.json').dependencies['better-sqlite3']")
electron=$(node --print "require('./app/package.json').devDependencies['electron']")

# Download better-sqlite3
# It's a git:// URL, don't bother doing it otherwise
npm pack better-sqlite3@$sqlite
tar --extract --file better-sqlite3-*.tgz

# Rebuild better-sqlite3
pushd package
npm install --no-audit
# https://www.electronjs.org/docs/latest/tutorial/using-native-node-modules#manually-building-for-electron
npx node-gyp rebuild --target=$electron --arch=x64 --dist-url=https://electronjs.org/headers
cp build/Release/better_sqlite3.node ../app/node_modules/better-sqlite3/build/Release
popd

pushd app

# Official icon is not recognized by electron builder
rm icon.ico
cp ../../assets/icon.png .

# - Patch platform detection
# - Disable auto update
sed --in-place '
	s/"win32"===process.platform/(true)/g
	s/_.Store.getState().app.preferences?.isAutoUpdaterDisabled/(true)/g
' .webpack/main/index.js

# Don't let electron-builder rebuild native dependencies
# https://www.electron.build/cli
npx --yes electron-builder@25 --linux appimage --config.npmRebuild=false
popd

popd
