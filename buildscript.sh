#!/bin/bash
# build script that uploads to ximera

export GIT_MERGE_AUTOEDIT no

# start by making sure ximera is up to date.
# assumes !/texmf/tex/latex/ximeraLatex has a clone of ximeraLatex
(cd ~/texmf/tex/latex/ximeraLatex ; git pull https://github.com/XimeraProject/ximeraLatex.git master )

#make sure the content is up to date with the master repository
git pull --no-edit https://github.com/OhioOER/LinearAlgebra.git master

#setup the content.  We assume here that a bearer 
# token already exists and is properly configured.
#
xake clean
xake name la

#build the content.
xake bake
xake frost

#upload to ximera
git push ximera
xake serve
