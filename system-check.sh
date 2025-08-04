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
