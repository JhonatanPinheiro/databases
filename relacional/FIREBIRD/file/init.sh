#!/bin/bash
set -e

RESTORE_SOURCE="/firebird/restore/db_jp.FDB"
TARGET="/var/lib/firebird/data/meubanco.fdb"

echo "Iniciando script de restauração..."

if [ -f "$RESTORE_SOURCE" ]; then
    echo "Arquivo de origem encontrado."

    if [ -f "$TARGET" ]; then
        echo "Removendo banco antigo existente..."
        rm -f "$TARGET"
    fi

    echo "Copiando banco restaurado para o destino..."
    cp "$RESTORE_SOURCE" "$TARGET"
    chown firebird:firebird "$TARGET"
    echo "Banco de dados restaurado com sucesso."
else
    echo "Arquivo de origem não encontrado: $RESTORE_SOURCE"
fi

echo "Iniciando o Firebird..."
exec "$@"
