#!/bin/bash

LINK_NAME="$HOME/workstation"
TARGET="/mnt/60451720-1d17-4b18-92b5-7fc948b73720"

if [ -L "$LINK_NAME" ]; then
    echo "O link simbólico '$LINK_NAME' já existe. Atualizando para apontar para '$TARGET'."
    rm "$LINK_NAME"
    ln -s "$TARGET" "$LINK_NAME"
    echo "Link simbólico atualizado: '$LINK_NAME' -> '$TARGET'"
else
    ln -s "$TARGET" "$LINK_NAME"
    echo "Link simbólico criado: '$LINK_NAME' -> '$TARGET'"
fi

DEV_LINK="$HOME/dev"
DEV_TARGET="/home/hattori/workstation/dev"

if [ -L "$DEV_LINK" ]; then
    echo "O link simbólico '$DEV_LINK' já existe. Atualizando para apontar para '$DEV_TARGET'."
    rm "$DEV_LINK"
    ln -s "$DEV_TARGET" "$DEV_LINK"
    echo "Link simbólico atualizado: '$DEV_LINK' -> '$DEV_TARGET'"
else
    ln -s "$DEV_TARGET" "$DEV_LINK"
    echo "Link simbólico criado: '$DEV_LINK' -> '$DEV_TARGET'"
fi


for workspace in finder-workspace opstream-workspace episource-workspace; do
    LINK="$HOME/$workspace"
    TARGET="/home/hattori/workstation/$workspace"

    if [ -L "$LINK" ]; then
        echo "O link simbólico '$LINK' já existe. Atualizando para apontar para '$TARGET'."
        rm "$LINK"
        ln -s "$TARGET" "$LINK"
        echo "Link simbólico atualizado: '$LINK' -> '$TARGET'"
    else
        ln -s "$TARGET" "$LINK"
        echo "Link simbólico criado: '$LINK' -> '$TARGET'"
    fi
done

SSH_LINK="$HOME/.ssh"
SSH_TARGET="/home/hattori/workstation/dev/config/.ssh"

if [ -L "$SSH_LINK" ]; then
    echo "O link simbólico '$SSH_LINK' já existe. Atualizando para apontar para '$SSH_TARGET'."
    rm "$SSH_LINK"
    ln -s "$SSH_TARGET" "$SSH_LINK"
    echo "Link simbólico atualizado: '$SSH_LINK' -> '$SSH_TARGET'"
else
    ln -s "$SSH_TARGET" "$SSH_LINK"
    echo "Link simbólico criado: '$SSH_LINK' -> '$SSH_TARGET'"
fi

ZSHRC_LINK="$HOME/.zshrc"
ZSHRC_TARGET="/home/hattori/workstation/dev/config/.zshrc"

if [ -L "$ZSHRC_LINK" ]; then
    echo "O link simbólico '$ZSHRC_LINK' já existe. Atualizando para apontar para '$ZSHRC_TARGET'."
    rm "$ZSHRC_LINK"
    ln -s "$ZSHRC_TARGET" "$ZSHRC_LINK"
    echo "Link simbólico atualizado: '$ZSHRC_LINK' -> '$ZSHRC_TARGET'"
else
    ln -s "$ZSHRC_TARGET" "$ZSHRC_LINK"
    echo "Link simbólico criado: '$ZSHRC_LINK' -> '$ZSHRC_TARGET'"
fi
