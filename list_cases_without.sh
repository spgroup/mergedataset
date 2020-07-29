find . -maxdepth 2 -mindepth 2 ! -wholename "./.git/**" ! -wholename "./studies/**"  -type d  \! -exec test -d "{}/$1" \; -print 

