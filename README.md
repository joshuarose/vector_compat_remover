# VectorCompat Remover

A super simple script that strips out attributes from https://github.com/wnafee/vector-compat, if you are in the scenario that I was in where you used vector-compat before VectorDrawableCompat was available in the support library and now want to remove the dependency from your project. (thanks to the creators of vector-compat their library served us well)

To run:

- Install Ruby
- Gem install nokogiri
- ruby vector_compat_remove.rb "/user/personage/android/res/drawable"(absolute path to drawable)
- Profit!


Disclaimer: Works on my machine, not responsible if it deletes all of your project files and delists your app from google play
