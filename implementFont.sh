#! /bin/bash

textToCenter=('Agregar fuente?                                a'
	'Remover fuente                                 r'
	'llevará una carpeta con fuente o sólo la fuente?'
	'Fuente                                         f'
	'Directorio                                     d'
	'acontinuación, se mostrará en el sitio actual sus archivos'
	'puede ejecutar este archivo donde tenga su fuente o la carpeta'
	'----Archivos-----'
	'-----------------'
	'introduzca nombre de la fuente de letra'
	'introduzca nombre del directorio'
	'trabajo finalizado!'
	'Add font?                                      a'
	'Remove font                                    r'
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

routesD(){
	echo $(clear >&2)
			if [ "$language" -eq 10 ]; then

for i in {17..19}; do
		center
	done

else

for i in {5..7}; do
		center
	done

fi

		ls

			if [ "$language" -eq 10 ]; then

for i in {19..19}; do
		center
	done

else

for i in {8..8}; do
		center
	done

fi

			if [ "$language" -eq 10 ]; then

for i in {22..22}; do
		center
	done

else

for i in {11..11}; do
		center
	done

fi

		read fuente
		if [ $switch -eq 10 ]; then
		sudo cp -r $directorio/$fuente /usr/share/fonts/truetype/
		else
		cd /usr/share/fonts/truetype/
		sudo rm -r /usr/share/fonts/truetype/$fuente
		fi
}

routesC(){

		echo $(clear >&2)

			if [ "$language" -eq 10 ]; then

for i in {17..19}; do
		center
	done

else

for i in {5..7}; do
		center
	done

fi

		ls

		echo ""

			if [ "$language" -eq 10 ]; then

for i in {20..21}; do
		center
	done

else

for i in {8..9}; do
		center
	done

fi

		read fuente

		if [ $switch -eq 10 ]; then
		sudo cp $directorio/"$fuente.ttf" /usr/share/fonts/truetype/
		else
		cd /usr/share/fonts/truetype/
		sudo rm -r /usr/share/fonts/truetype/"$fuente.ttf"
		fi
}

function center() {

	variable=${#textToCenter}
	echo "${textToCenter[i]}"
	echo ''

}

Menu() {

	echo $(clear >&2)

	echo ""
	echo ""
	echo ""



	if [ "$language" -eq 10 ]; then

for i in {12..13}; do
		center
	done

else

for i in {0..1}; do
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
*)
Menu
esac

echo $(clear &>2)

	if [ "$language" -eq 10 ]; then

for i in {14..16}; do
		center
	done

else

for i in {2..4}; do
		center
	done

fi


	returntoCero

	echo $(clear >&2)

if [ "$language" -eq 10 ]; then

for i in {23..23}; do
		center
	done

else

for i in {11..11}; do
		center
	done

fi

}

returntoCero(){

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

start(){

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

start
