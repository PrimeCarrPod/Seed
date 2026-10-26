#!/bin/bash
# VoiceDictation build wrapper
set -e

cd "$(dirname "$0")"

case "${1:-build}" in
    clean)
        python3 build.py clean
        ;;
    install)
        python3 build.py install
        ;;
    *)
        python3 build.py
        ;;
esac