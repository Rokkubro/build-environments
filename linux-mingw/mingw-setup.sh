#!/usr/bin/bash -e
# install pefile
pip3 install pefile --break-system-packages

# ffmpeg
FFMPEG_VER='6.0'
LINK_PATH="autobuild-2023-03-31-12-50/ffmpeg-n6.0-11-g3980415627-win64-gpl-shared-6.0"
FILENAME="${LINK_PATH##*/}"
echo "Downloading ffmpeg (${FFMPEG_VER})..."
wget -c "https://github.com/BtbN/FFmpeg-Builds/releases/download/${LINK_PATH}.zip"
7z x "${FILENAME}.zip"

echo "Copying ffmpeg ${FFMPEG_VER} files to sysroot..."
cp -v "${FILENAME}"/bin/*.dll /usr/x86_64-w64-mingw32/lib/
cp -vr "${FILENAME}"/include /usr/x86_64-w64-mingw32/
cp -v "${FILENAME}"/lib/*.{a,def} /usr/x86_64-w64-mingw32/lib/

# clang
CLANG_VER='16.0.5'
LINK_PATH="20230603/llvm-mingw-20230603-ucrt-ubuntu-20.04-x86_64"
FILENAME="${LINK_PATH##*/}"
echo "Downloading clang (${CLANG_VER})..."
wget -c "https://github.com/mstorsjo/llvm-mingw/releases/download/${LINK_PATH}.tar.xz"
tar -xf "${FILENAME}.tar.xz"

echo "Copying Clang ${CLANG_VER} files to sysroot..."
cp -aLv "${FILENAME}"/* /usr/
echo "Copying required Clang binaries to sysroot..."
cd /clang64
find . -name \*.dll\* -exec cp -prv --parents {} /usr/x86_64-w64-mingw32/ \;
# remove the directory
ABS_PATH="$(readlink -f $0)"
rm -rf "$(dirname ${ABS_PATH})"
