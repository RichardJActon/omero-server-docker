#!/usr/bin/env bash
repo=ome/omero-figure
OMERODIR=$1
# repo=$1
tag=$(curl -s "https://api.github.com/repos/$repo/releases/latest" | jq -r '.tag_name')
# echo $tag
tag_sha=$(curl -s "https://api.github.com/repos/$repo/git/ref/tags/$tag" | jq -r '.object.sha')
# echo $tag_sha
sha=$(curl -s "https://api.github.com/repos/$repo/git/tags/$tag_sha" | jq -r '.object.sha')
# echo $sha

curl -L -o \
$OMERODIR/lib/scripts/omero/figure_scripts/Figure_To_Pdf.py \
https://raw.githubusercontent.com/ome/omero-figure/$sha/omero_figure/scripts/omero/figure_scripts/Figure_To_Pdf.py 

chown omero-server:omero-server \
$OMERODIR/lib/scripts/omero/figure_scripts/Figure_To_Pdf.py

chmod 644 \
$OMERODIR/lib/scripts/omero/figure_scripts/Figure_To_Pdf.py

