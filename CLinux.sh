#! /bin/bash

textToCenter=('Agregar                                  a'
	'Remover                                  r'
	'Salir                                    q'
	'llevará una carpeta o sólo la fuente?'
	'Fuente                                         f'
	'Directorio                                     d'
	'Será de Fuente de letra, Tema o Cursor?'
	'Fuente                                         f'
	'Tema                                           t'
	'Cursor                                         c'
	'acontinuación, se mostrará en el sitio actual sus archivos'
	'puede ejecutar este archivo donde tenga su fuente o la carpeta'
	'----Archivos-----'
	'-----------------'
	'introduzca nombre del archivo'
	'introduzca nombre del directorio'
	'trabajo finalizado!'
	'Add font?                                      a'
	'Remove font                                    r'
	'Quit                                           q'
	'will it carry a folder with fonts or just the fonts?'
	'Font                                           f'
	'Directory                                      d'
	'Font                                           f'
	'Theme                                          t'
	'Cursor                                         c'
	'your files will then be displayed at the current location'
	'you can run this file wherever you have your source or the folder'
	'----Files--------'
	'-----------------'
	'enter archive name'
	'enter directory name'
	'job finished!'
)

routesD() {
	echo $(clear >&2)
	if [ "$language" -eq 10 ]; then

		for i in {26..28}; do
			center
		done

	else

		for i in {10..12}; do
			center
		done

	fi

	if [ $switch -eq 10 ]; then

		ls

	fi

	if [ "$language" -eq 10 ]; then

		for i in {29..29}; do
			center
		done

	else

		for i in {13..13}; do
			center
		done

	fi

	if [ "$language" -eq 10 ]; then

		for i in {31..31}; do
			center
		done

	else

		for i in {15..15}; do
			center
		done

	fi

	if [ $switch -eq 10 ]; then

		read fuente
		adder

	else

		remover

	fi
}

routesC() {

	echo $(clear >&2)

	if [ "$language" -eq 10 ]; then

		for i in {26..28}; do
			center
		done

	else

		for i in {10..12}; do
			center
		done

	fi

	ls

	echo ""

	nameForDecition

	read fuente

	if [ $switch -eq 10 ]; then
		sudo cp $directorio/"$fuente.ttf" /usr/share/fonts/truetype/

	else
		cd /usr/share/fonts/truetype/
		sudo rm -r /usr/share/fonts/truetype/"$fuente.ttf"
	fi
}

Menu() {

	echo $(clear >&2)

	echo ""
	echo ""
	echo ""

	if [ "$language" -eq 10 ]; then

		for i in {17..19}; do
			center
		done

	else

		for i in {0..2}; do
			center
		done

	fi

	read -s -n 1 modify

	case $modify in
	a)
		switch=10
		;;
	r)
		switch=20
		;;
	q)
		exit
		;;
	*)
		Menu
		;;
	esac

	echo $(clear >&2)

	if [ "$language" -eq 10 ]; then

		for i in {23..25}; do
			center
		done

	else

		for i in {6..9}; do
			center
		done
	fi

	Format

	echo $(clear >&2)

	if [ $aux -eq 10 ]; then

		if [ "$language" -eq 10 ]; then

			for i in {20..22}; do
				center
			done

		else

			for i in {3..5}; do
				center
			done

		fi

		returntoCero

	else

		routesD

	fi

	echo $(clear >&2)

	if [ "$language" -eq 10 ]; then

		for i in {28..28}; do
			center
		done

	else

		for i in {17..17}; do
			center
		done

	fi

	Menu

}

returntoCero() {

	read -s -n 1 decision

	case $decision in
	f)
		routesC
		;;
	d)
		routesD
		;;
	*)
		returntoCero
		;;
	esac
}

Format() {

	read -s -n 1 elementFormat

	case $elementFormat in
	f)
		operation=10
		aux=10
		;;
	t)
		operation=20
		aux=20
		;;
	c)
		operation=30
		aux=30
		;;

	*)
		Format
		;;
	esac
}

start() {

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
			language=10

			Menu
			;;
		s)
			language=20

			Menu
			;;
		*)
			start
			echo ''
			;;
		esac

	fi

}

function center() {

	variable=${#textToCenter}
	echo "${textToCenter[i]}"
	echo ''

}

eraser() {
	if [ "$language" -eq 10 ]; then

		for i in {26..28}; do
			center
		done

	else

		for i in {10..12}; do
			center
		done

	fi
}

nameForDecition() {

	if [ "$language" -eq 10 ]; then

		for i in {29..30}; do
			center
		done

	else

		for i in {13..14}; do
			center
		done

	fi

}

adder() {

	if [ $operation -eq 10 ]; then

		sudo cp -r $directorio/$fuente /usr/share/fonts/truetype/

	elif [ $operation -eq 20 ]; then

		sudo cp -r $directorio/$fuente /usr/share/themes

	else

		sudo cp -r $directorio/$fuente /usr/share/icons

	fi
}

remover() {

	if [ $operation -eq 10 ]; then
		$(clear >&2)

		echo ""

		eraser

		cd /usr/share/fonts/truetype/
		ls

		nameForDecition

		read fuente
		sudo rm -r /usr/share/fonts/truetype/$fuente

	elif [ $operation -eq 20 ]; then

		$(clear >&2)

		eraser

		cd /usr/share/themes/
		ls

		nameForDecition

		read fuente
		sudo rm -r /usr/share/themes/$fuente

	else

		$(clear >&2)

		eraser

		cd /usr/share/icons/
		ls

		nameForDecition
		read fuente
		sudo rm -r /usr/share/icons/$fuente

	fi
}

start
