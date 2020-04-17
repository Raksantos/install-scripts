#!/bin/bash

installUserApps(){
    programs=$(<userApps.txt);
    $programs;
}

installDevApps(){
    programs=$(<devApps.txt);
    $programs;
}

preparingSO(){
    sudo apt install software-properties-common apt-transport-https wget -y
    sudo apt install snapd -y
    sudo apt install libgconf-2-4 libappindicator1 -y
    sudo apt-get install libxss1 libappindicator1 libindicator7 -y
    wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
    sudo apt install build-essential -y
    sudo apt-get install build-essential checkinstall libcurl4-openssl-dev bison flex qt5-default qttools5-dev libssl-dev libgtk-3-dev libpcap-d -y
    sudo add-apt-repository ppa:wireshark-dev/stable
    sudo add-apt-repository ppa:wireshark-dev/stable 
    sudo apt-get update
    sudo apt-get upgrade
}

menu(){
    option=-1;
    while [ $option != 3 ]
    do
    read -p "Por favor, informe a sua opção:"$'\n\n'"1 - Instalar apps de usuários padrão;"$'\n'"2 - Instalar apps de desenvolvedores;"$'\n'"3 - Preparar o SO;"$'zn'"4 - Sair: " option;

    echo $'\n';

    if [ $option -eq 1 ]
    then
        installUserApps
    elif [ $option -eq 2 ]
    then
        installDevApps
    elif [ $option -eq 3 ]
    then
        preparingSO;
    elif [ $option -eq 4 ]
    then
        echo "Até mais";
    else
        echo "Opção inválida!"$'\n';
    fi

    done
}

menu;