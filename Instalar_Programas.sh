#!/bin/bash
# Script que instala programas

read -p "Ingrese el nombre del programa: " programa

sudo apt update && sudo apt upgrade -y
sudo apt install -y "$programa"