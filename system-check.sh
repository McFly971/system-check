#!/bin/bash

echo "=== CHECK RAPIDE DU SYSTEME ==="
echo "Date et heure : $(date)"
echo "Espace disque :"
df -h ~
echo ""
echo "Mémoire utilisé :"
free -h
echo ""
echo "Derniers fichiers modifiés :"
find ~ -type f -printf '%TY-%Tm-%Td %TT %p\n' 2>/dev/null | sort -r | head -5

# === Couleurs ===
green='\033[0;32m'
blue='\033[0;34m'
red='\033[0;31m'
nc='\033[0m' # reset

# === Menu ===
while true; do

clear
echo -e "${blue}=== MENU DE CHECK SYSTEME ===${nc}"
echo -e "1.Vérifier l'espace disque"
echo -e "2.Vérifier la mémoire"
echo -e "3.Derniers fichiers modifiés"
echo -e "4.Verification de la connexion réseau."
echo -e "5.Sauvegarder l'état système dans un fichier"
echo -e "6.Quitter"
echo ""

read -p "Votre choix :" choix

case $choix in
1)
 echo -e "Espace disque "
df -h
read -p "Appuie sur [Entrée] pour revenir au menu ..."
;;
2)
 echo -e "Utilisation mémoire "
free -h
read -p "Appuie sur [Entrée] pour revenir au menu ..."
;;
3)
 echo -e "Fichiers récemment modifiés "
find . -type f -printf '%TY-%Tm-%Td %TT %p\n' | sort -r | head -10
read -p "Appuie sur [Entrée] pour revenir au menu ..."
;;
4)
echo -e "Vérification de la connexion réseau."
ping -c 2 8.8.8.8 >/dev/null && echo "Connexion Internet: OK" ||echo "Connexion Internet: ECHEC"
read -p" Appuie sur [Entrée] pour revenir au menu ..."
;;
5)
log_file="system-check-$(date +%Y%m%d-%H%M%S) .log"
echo "Sauvegarde dans $log_file"
{
echo "=== Etat du système à $(date) ==="
echo ""
df -h
echo ""
free -h
echo ""
find ~ -type f -printf '+%TY-%Tm-%Td %TT %p\n' 2>dev÷null | sort -r | head -10
} > "$log_file"
echo "Fichier sauvegardé : $log_file"
read -p "Appuie sur [Entrée] pour revenir au menu..."
;;
6)
 echo -e "Fermeture du script."
break 
;;
*)
 echo -e "Choix invalide."
;;
esac

done
