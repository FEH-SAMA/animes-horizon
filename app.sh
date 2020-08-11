#!/bin/bash
# POWERED BY: FEH'S / ZEN / D4RKS

# VARIAVÉIS
	TITLE="·:Animes Horizon:·"

echo 'Inicializando.'

sleep 1
./database_checker.sh | zenity --progress --title="$TITLE" --text="Verificando os bancos de dados, Aguarde ..." --auto-close --no-cancel --pulsate --time-remaining

sleep 1
clear
sleep 3

echo '░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░'; sleep 1
echo '░░░█████╗░███╗░░██╗██╗███╗░░░███╗███████╗░██████╗░░░░░░░░░░░░░░░'; sleep 1
echo '░░██╔══██╗████╗░██║██║████╗░████║██╔════╝██╔════╝░░░░░░░░░░░░░░░'; sleep 1
echo '░░███████║██╔██╗██║██║██╔████╔██║█████╗░░╚█████╗░░░░░░░░░░░░░░░░'; sleep 1
echo '░░██╔══██║██║╚████║██║██║╚██╔╝██║██╔══╝░░░╚═══██╗░░░░░░░░░░░░░░░'; sleep 1
echo '░░██║░░██║██║░╚███║██║██║░╚═╝░██║███████╗██████╔╝░░░░░░░░░░░░░░░'; sleep 1
echo '░░╚═╝░░╚═╝╚═╝░░╚══╝╚═╝╚═╝░░░░░╚═╝╚══════╝╚═════╝░░░░░░░░░░░░░░░░'; sleep 1
echo '░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░'; sleep 1
echo '░░░░░░░░░░██╗░░██╗░█████╗░██████╗░██╗███████╗░█████╗░███╗░░██╗░░'; sleep 1
echo '░░░░░░░░░░██║░░██║██╔══██╗██╔══██╗██║╚════██║██╔══██╗████╗░██║░░'; sleep 1
echo '░░░░░░░░░░███████║██║░░██║██████╔╝██║░░███╔═╝██║░░██║██╔██╗██║░░'; sleep 1
echo '░░░░░░░░░░██╔══██║██║░░██║██╔══██╗██║██╔══╝░░██║░░██║██║╚████║░░'; sleep 1
echo '░░░░░░░░░░██║░░██║╚█████╔╝██║░░██║██║███████╗╚█████╔╝██║░╚███║░░'; sleep 1
echo '░░░░░░░░░░╚═╝░░╚═╝░╚════╝░╚═╝░░╚═╝╚═╝╚══════╝░╚════╝░╚═╝░░╚══╝░░'; sleep 1
echo '░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░'

login() {
	USER=$(zenity --forms --title="$TITLE" --add-entry="Email/Usuário" --add-password="Senha");
	echo $USER
}

register() {
	USER=$(zenity --forms --title="$TITLE" --add-entry="Nome de Usuário" --add-entry="Email" --add-password="Senha" --add-password="Digita a senha novamente.")
	echo $USER
}

home() {
	SELECIONADO=$(zenity --list --title="$TITLE" --radiolist --column='#' --column='Option' FALSE "Registrar" FALSE "Entrar" TRUE "Cancelar")
	
	case $SELECIONADO in
		Entrar)
			login
		;;

		Registrar)
			register
		;;

		**)
			echo 'Ok, Até mais!'
		;;
	esac
}

home