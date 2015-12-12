#!/bin/bash
set -e

git clone "https://${GH_REF}" -b gh-pages gh-pages
cp output/* gh-pages/
cd gh-pages/
tree -H . > index.html
git config user.name "Travis CI"
git add *
git commit -m "Deployed from Travis CI"
git push origin gh-pages
