#!/bin/bash

CONFIG_DIRS=(
	"${HOME}/.config/sway/"
	"${HOME}/.config/waybar/"
	"${HOME}/.config/alacritty/"
	"${HOME}/.config/neofetch/"
	"${HOME}/.config/wofi/"
)

GITHUB_REPO="/home/simoes/dev/sway-config"

cd "${GITHUB_REPO}" || { echo "Github repo directory not found."; exit 1; }

for DIR  in "${CONFIG_DIRS[@]}"; do
	if [[ -d "${DIR}" ]]; then
		cp -r  "${DIR}" "${GITHUB_REPO}" || { echo "Failed to copy ${DIR}" }; continue;}
		echo "Copied ${DIR} to ${GITHUB_REPO}."
	else 
		echo "Warning: Something went wrong copying ${DIR} to ${GITHUB_REPO}."
	fi
done

git add . || { echo "Failed to add changes."; exit 1;}
git commit -m "Commited config files." || { echo "Commit failed."; exit 1;}
git push origin main || { echo "Push to Github failed."; exit 1;}
