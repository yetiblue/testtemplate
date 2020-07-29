#!/bin/sh

set -e

echo "Copying frontend dependencies..."
sudo ln -s /deps/node_modules .
echo "Starting frontend dev server..."
npm run dev
