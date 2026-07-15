#!/bin/bash

outdir="/tmp/foundations"

do_pdflatex() {
	pdflatex \
		--shell-escape \
		--output-directory "$outdir" \
		main.tex
}

do_biblatex() {
	biber \
		--output-directory "$outdir" \
		main
}

if [[ ! -a "$outdir" ]]
then
	mkdir -p "$outdir" 
fi

# for dir in tasks theory
# do
# 	if [[ ! -a "$outdir/$dir" ]]
# 	then
# 		mkdir -p "$outdir/$dir"
# 	fi
# done


case $1 in
	--all)
		do_pdflatex
		do_biblatex
		do_pdflatex
		;;

	*)
		do_pdflatex
esac
