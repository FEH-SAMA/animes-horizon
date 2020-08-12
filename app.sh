#!/bin/bash
# POWERED BY: FEH'S / ZEN / D4RKS

# VARIAVÉIS
	TITLE="·:Animes Horizon:·"

echo 'Inicializando.'

sleep 1
./database_checker.sh | zenity --progress --title="$TITLE" --text="Verificando bancos de dados, Aguarde ..." --auto-close --no-cancel --pulsate --time-remaining

sleep 1
clear
sleep 3

echo '░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░'; sleep 1
echo '░░░░░░░░░░░█████╗░███╗░░██╗██╗███╗░░░███╗███████╗░██████╗░░░░░░░░░░░░░░░░░░░░░░░'; sleep 1
echo '░░░░░░░░░░██╔══██╗████╗░██║██║████╗░████║██╔════╝██╔════╝░░░░░░░░░░░░░░░░░░░░░░░'; sleep 1
echo '░░░░░░░░░░███████║██╔██╗██║██║██╔████╔██║█████╗░░╚█████╗░░░░░░░░░░░░░░░░░░░░░░░░'; sleep 1
echo '░░░░░░░░░░██╔══██║██║╚████║██║██║╚██╔╝██║██╔══╝░░░╚═══██╗░░░░░░░░░░░░░░░░░░░░░░░'; sleep 1
echo '░░░░░░░░░░██║░░██║██║░╚███║██║██║░╚═╝░██║███████╗██████╔╝░░░░░░░░░░░░░░░░░░░░░░░'; sleep 1
echo '░░░░░░░░░░╚═╝░░╚═╝╚═╝░░╚══╝╚═╝╚═╝░░░░░╚═╝╚══════╝╚═════╝░░░░░░░░░░░░░░░░░░░░░░░░'; sleep 1
echo '░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░'; sleep 1
echo '░░░░░░░░░░░░░░░░░░██╗░░██╗░█████╗░██████╗░██╗███████╗░█████╗░███╗░░██╗░░░░░░░░░░'; sleep 1
echo '░░░░░░░░░░░░░░░░░░██║░░██║██╔══██╗██╔══██╗██║╚════██║██╔══██╗████╗░██║░░░░░░░░░░'; sleep 1
echo '░░░░░░░░░░░░░░░░░░███████║██║░░██║██████╔╝██║░░███╔═╝██║░░██║██╔██╗██║░░░░░░░░░░'; sleep 1
echo '░░░░░░░░░░░░░░░░░░██╔══██║██║░░██║██╔══██╗██║██╔══╝░░██║░░██║██║╚████║░░░░░░░░░░'; sleep 1
echo '░░░░░░░░░░░░░░░░░░██║░░██║╚█████╔╝██║░░██║██║███████╗╚█████╔╝██║░╚███║░░░░░░░░░░'; sleep 1
echo '░░░░░░░░░░░░░░░░░░╚═╝░░╚═╝░╚════╝░╚═╝░░╚═╝╚═╝╚══════╝░╚════╝░╚═╝░░╚══╝░░░░░░░░░░'; sleep 1
echo '░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░'

login() {
	init() {
		DADOS=$(zenity --forms --title="$TITLE" --add-entry="Email/Usuário" --add-password="Senha");

		EMAIL=$(echo "$DADOS" | cut -d, -f1)
		PASS=$(echo "$DADOS" | cut -d, -f2)		
	}

	init

}

register() {
	checker_data() {
		if [[ " " -ne $USER ]]; then
			if [[ " " -ne $EMAIL ]]; then
				 EMAIL_CHECKER=$(echo "$EMAIL" | grep "@gmail.com")
				 if [[  " " -ne $EMAIL_CHECKER ]]; then
				 	if [[ " " -ne $PASS ]]; then
						case $PASS_RETRY in
							$PASS)
								zenity --notification --text="Ola $USER, seja bem vindo ao Animes Horizon!"
								echo -e "$DADOS\n$(cat ./databases/users.txt)" > ./databases/users.txt
								sleep 1
								./views/index.sh
							;;
							**)
								zenity --error --title="$TITLE" --text="As senhas não se coincidem !" --no-wrap --ellipsize
								init
							;;
						esac
					else
						zenity --error --title="$TITLE" --text="Você precisa adicionar uma senha." --no-wrap --ellipsize
						init
				 	fi
				else
					zenity --error --title="$TITLE" --text="Este email não é valido." --no-wrap --ellipsize
					init
				fi
			else
				zenity --error --title="$TITLE" --text="Você precisa adicionar um email." --no-wrap --ellipsize
				init
			fi
		else
			zenity --error --title="$TITLE" --text="Você precisa colocar um nome de usuário." --no-wrap --ellipsize
			init
		fi
	}

	init() {
		DADOS=$(zenity --forms --title="$TITLE" --add-entry="Nome de Usuário" --add-entry="Email" --add-password="Senha" --add-password="Digita a senha novamente." --separator=",")

		USER=$(echo "$DADOS" | cut -d, -f1)
		EMAIL=$(echo "$DADOS" | cut -d, -f2)
		PASS=$(echo "$DADOS" | cut -d, -f3)
		PASS_RETRY=$(echo "$DADOS" | cut -d, -f4)
		
		checker_data
	}

	init
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