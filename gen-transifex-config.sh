#/bin/bash


cat <<__CONFIG > .tx/config
[main]
host = https://www.transifex.com

__CONFIG

find docs -name \*.md | perl -ne 'chomp; $input=$_; s/^docs\///; $file=$_;  tr|/\.|__|;  print "[dcrdocs.$_]\nfile_filter = src/i18n/<lang>/$file\nsource_file = $input\nsource_lang = en\ntype = GITHUBMARKDOWN\n\n"' >> .tx/config
