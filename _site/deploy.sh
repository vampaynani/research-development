JEKYLL_ENV=production bundle exec jekyll b
cd _site && git add . && git commit -m \"$(git log '--format=format:%H' master -1)\" && git push --force