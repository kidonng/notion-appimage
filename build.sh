# Notion AppImage
# Dependencies: 7z, node & npm, standard unix tools

# 1. Fetch installer & extract app
installer=installer.exe
app=app-64.7z
asar=app.asar

curl --location https://www.notion.so/desktop/windows/download --output $installer

7z e $installer \$PLUGINSDIR/$app
7z e $app resources/$asar
npx -y @electron/asar extract $asar app

rm $installer $app $asar

# 2. Build better-sqlite3
sqlite=$(node --print "require('./app/package.json').dependencies['better-sqlite3']")
electron=$(node --print "require('./app/package.json').devDependencies['electron']")

# "Download" the pacakge with npm instead of parsing the package spec ourselves
npm pack $sqlite
tar=better-sqlite3-*.tgz
tar --extract --file $tar
rm $tar

pushd package
# Will build later
npm install --ignore-scripts
# https://www.electronjs.org/docs/latest/tutorial/using-native-node-modules#manually-building-for-electron
npx node-gyp rebuild --target=$electron --arch=x64 --dist-url=https://electronjs.org/headers
cp build/Release/better_sqlite3.node ../app/node_modules/better-sqlite3/build/Release/
popd
rm -r package

# 3. Build AppImage
cd app
# Icon does not work, no idea, skip for now
rm icon.ico
# https://www.electron.build/cli
npx -y electron-builder --linux appimage --config ../electron-builder.yml
