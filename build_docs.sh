#! /bin/sh
absolutePath=${PWD}


echo "======================================="
echo " E N  -  E N G L I S H  V E R S I O N "
echo "INFO	-  Building en_docs into directory site/"
mkdocs build -f mkdocs.yml -d site



####################
# BUILD DE VERSION
echo "======================================="
echo " D E  -  G E R M A N  V E R S I O N "
echo "INFO	-  Comparing Files and copy missing contents from en version"
for i in `diff -rq docs/ de_docs/ | grep "Only in" | sed 's/Only in//' | sed 's/:/\//' | sed 's/ //' | sed 's/docs\///' | awk -F' ' '{print $1$2}'`; do echo $i; cp ${absolutePath}/docs/$i ${absolutePath}/de_docs/$i;  done

echo "INFO	-  Building de_docs into directory site/de"
mkdocs build -f de_mkdocs.yml -d site/de

# DELETE CSS,JS,FONTS FROM de/ DIRECTORY
echo "INFO	-  Remove files and directories site/de/css/ js/ fonts/ Icons/"
rm -rf site/de/css/
rm -rf site/de/js/
rm -rf site/de/fonts/
rm -rf site/de/Icons

# ADD SYMLINKS TO CSS,JS,FONTS DIRECTORY
# css
echo "INFO	-  Symlink site/css/ to site/de/css/ js/ fonts/ Icons/"
dirFrom="${absolutePath}/site/css"
dirTo="${absolutePath}/site/de/css"
ln -s $dirFrom $dirTo

# js
dirFrom="${absolutePath}/site/js"
dirTo="${absolutePath}/site/de/js"
ln -s $dirFrom $dirTo

# fonts
dirFrom="${absolutePath}/site/fonts"
dirTo="${absolutePath}/site/de/fonts"
ln -s $dirFrom $dirTo

# Icons
dirFrom="${absolutePath}/site/Icons"
dirTo="${absolutePath}/site/de/Icons"
ln -s $dirFrom $dirTo





####################
# BUILD RU VERSION
echo "======================================="
echo " R U  -  R U S S I A N  V E R S I O N "
echo "INFO	- Comparing Files and copy missing contents from en version"
for i in `diff -rq docs/ ru_docs/ | grep "Only in" | sed 's/Only in//' | sed 's/:/\//' | sed 's/ //' | sed 's/docs\///' | awk -F' ' '{print $1$2}'`; do echo $i; cp ${absolutePath}/docs/$i ${absolutePath}/ru_docs/$i;  done
echo "INFO	-  Building ru_docs into directory site/ru"
mkdocs build -f ru_mkdocs.yml -d site/ru

# DELETE CSS,JS,FONTS FROM de/ DIRECTORY
echo "INFO	-  Remove files and directory site/ru/css/ js/ fonts/ Icons/"
rm -rf site/ru/css/
rm -rf site/ru/js/
rm -rf site/ru/fonts/
rm -rf site/ru/Icons/

# ADD SYMLINKS TO CSS,JS,FONTS DIRECTORY
# css
echo "INFO	-  Symlink site/css/ to site/ru/css/ js/ fonts/ Icons/"
dirFrom="${absolutePath}/site/css"
dirTo="${absolutePath}/site/ru/css"
ln -s $dirFrom $dirTo

# js
dirFrom="${absolutePath}/site/js"
dirTo="${absolutePath}/site/ru/js"
ln -s $dirFrom $dirTo

# fonts
dirFrom="${absolutePath}/site/fonts"
dirTo="${absolutePath}/site/ru/fonts"
ln -s $dirFrom $dirTo

# Icons
dirFrom="${absolutePath}/site/Icons"
dirTo="${absolutePath}/site/ru/Icons"
ln -s $dirFrom $dirTo

