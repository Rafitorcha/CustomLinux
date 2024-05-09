#! /bin/bash

textToCenter=('llevará una carpeta con fuente o sólo la fuente?'
	'Fuente                                         f'
	'Directorio                                     d'
	'acontinuación, se mostrará en el sitio actual sus archivos'
	'puede ejecutar este archivo donde tenga su fuente o la carpeta'
	'----Archivos-----'
	'-----------------'
	'introduzca nombre de la fuente de letra'
	'introduzca nombre del directorio'
	'trabajo finalizado!'
	'will it carry a folder with fonts or just the fonts?'
	'Font                                           f'
	'Directory                                      d'
	'your files will then be displayed at the current location'
	'you can run this file wherever you have your source or the folder'
	'----Files--------'
	'-----------------'
	'enter font name'
	'enter directory name'
	'job finished!'
)

function center() {

	variable=${#textToCenter}

	echo "${textToCenter[i]}"
	echo ''

}

EnglishMenu() {

	echo $(clear >&2)

	echo ""
	echo ""
	echo ""

	for i in {10..12}; do
		center
	done

	read -s -n 1 decision

	case $decision in
	f)

		echo $(clear >&2)

		for i in {13..15}; do
			center
		done

		ls
		echo ""
		for i in {16..17}; do
			center
		done

		read fuente
		sudo cp $directorio/"$fuente.ttf" /usr/share/fonts/truetype/
		;;
	d)

		echo $(clear >&2)

		for i in {13..15}; do
			center
		done

		ls

		for i in {16..16}; do
			center
		done

		for i in {18..18}; do
			center
		done

		read fuente
		sudo cp -r $directorio/$fuente /usr/share/fonts/truetype/
		;;
	esac

	echo $(clear >&2)

	for i in {19..19}; do
		center
	done
}

SpanishMenu() {

	echo $(clear >&2)

	echo ""
	echo ""
	echo ""

	for i in {0..2}; do
		center
	done

	read -s -n 1 decision

	case $decision in
	f)

		echo $(clear >&2)

		for i in {3..5}; do
			center
		done

		ls

		for i in {6..7}; do
			center
		done

		read fuente
		sudo cp $directorio/"$fuente.ttf" /usr/share/fonts/truetype/
		;;
	d)

		echo $(clear >&2)

		for i in {3..5}; do
			center
		done

		ls
		echo ""

		for i in {6..6}; do
			center
		done

		for i in {8..8}; do
			center
		done

		read fuente
		sudo cp -r $directorio/$fuente /usr/share/fonts/truetype/
		;;
	esac

	echo $(clear >&2)

	for i in {9..9}; do
		center
	done
}

if [ ! -d /usr/share/fonts ]; then

	cd /usr/share/
	sudo mkdir fonts/truetype

else
	directorio=$PWD

	echo $(clear >&2)

	echo "English/Inglés              e"
	echo "Spanish/Español             s"

	read -s -n 1 desition

	case $desition in
	e)
		EnglishMenu
		;;
	s)
		SpanishMenu
		;;
	esac

fi
