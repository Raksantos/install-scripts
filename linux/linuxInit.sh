installUserApps(){
    programs=$(<userApps.txt);
    echo "$programs";
}

installDevApps(){
    programs=$(<devApps.txt);
    echo "$programs";
}

menu(){
    option=-1;
    while [ $option != 3 ]
    do
    read -p "Por favor, informe a sua opção:"$'\n\n'"1 - Instalar apps de usuários padrão;"$'\n'"2 - Instalar apps de desenvolvedores;"$'\n'"3 - Sair: " option;

    echo $'\n';

    if [ $option -eq 1 ]
    then
        installUserApps
    elif [ $option -eq 2 ]
    then
        installDevApps
    elif [ $option -eq 3 ]
    then
        echo "Até mais";
    else
        echo "Opção inválida!"$'\n';
    fi

    done
}

menu;