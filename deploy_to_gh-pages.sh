#!/bin/bash
set -e

GIT_SSH_COMMAND="ssh -i deploy_key" git clone "https://${GH_REF}" -b gh-pages gh-pages
cp output/* gh-pages/
cd gh-pages/
tree -H . > index.html
git config user.name "Travis CI"
git add *
git commit -m "Deployed from Travis CI"
GIT_SSH_COMMAND="ssh -i ../deploy_key" git push origin gh-pages
