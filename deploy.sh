#!/bin/bash
git checkout main && \
(git branch -D dist || true) && \
git checkout -b dist && \
rm .gitignore && \
npm run build && \
cp dist/odds/browser/index.html dist/odds/browser/404.html && \
cp CNAME dist/odds/browser/ || true && \
git add dist/odds/browser && \
git commit -m dist && \
(git branch -D gh-pages || true) && \
git subtree split --prefix dist/odds/browser -b gh-pages && \
git push -f origin gh-pages:gh-pages && \
git checkout main && \
git branch -D gh-pages && \
git branch -D dist && \
git checkout . 