Checkout `https://github.com/ecamos-investment/desktop` and build. Run

    rm -rf dist
    mkdir dist
    cp src/libsync/libnextcloudsync.so.0 dist
    cp src/csync/libocsync.so.0 dist
    cp bin/nextcloudcmd dist
    cp bin/sync-exclude.lst dist

and copy dist directory to root dir.
