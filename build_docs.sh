#! /bin/sh
absolutePath=${PWD}

echo "======================================="
echo " E N  -  E N G L I S H  V E R S I O N "
echo "INFO	-  Building en_docs into directory site/"
mkdocs build -f mkdocs.yml -d site

LANG="de"
for L in $LANG; do
    ####################
    # BUILD $LANG VERSION
    echo "======================================="
    echo $L " V E R S I O N "
    echo "INFO	-  Comparing Files and copy missing contents from en version"
    for i in `diff -rq docs/ ${L}_docs/ | grep "Only in" | sed 's/Only in//' | sed 's/:/\//' | sed 's/ //' | sed 's/docs\///' | awk -F' ' '{print $1$2}'`; do echo $i; cp ${absolutePath}/docs/$i ${absolutePath}/${L}_docs/$i;  done
    echo "INFO	-  Building "$L"_docs into directory site/"$L
    mkdocs build -f ${L}_mkdocs.yml -d site/${L}

    # DELETE CSS,JS,FONTS FROM $LANG DIRECTORY
    echo "INFO	-  Remove files and directories site/"$L"/css/ js/ fonts/ Icons/"
    rm -rf site/$L/css/
    rm -rf site/$L/js/
    rm -rf site/$L/fonts/
    rm -rf site/$L/Icons

    # ADD SYMLINKS TO CSS,JS,FONTS DIRECTORY
    # css
    echo "INFO	-  Symlink site/css/ to site/"$L"/css/ js/ fonts/ Icons/"
    dirFrom="${absolutePath}/site/css"
    dirTo="${absolutePath}/site/${L}/css"
    ln -s $dirFrom $dirTo

    # js
    dirFrom="${absolutePath}/site/js"
    dirTo="${absolutePath}/site/${L}/js"
    ln -s $dirFrom $dirTo

    # fonts
    dirFrom="${absolutePath}/site/fonts"
    dirTo="${absolutePath}/site/${L}/fonts"
    ln -s $dirFrom $dirTo

    # Icons
    dirFrom="${absolutePath}/site/Icons"
    dirTo="${absolutePath}/site/${L}/Icons"
    ln -s $dirFrom $dirTo

done

