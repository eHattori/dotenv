#!/bin/bash

# Função para matar processos na porta 5432
kill_port_5432() {
    echo "Procurando processos na porta 5432..."

    # Encontra os IDs dos processos que estão usando a porta 5432
    local pids=$(lsof -t -i :5432)

    # Verifica se a variável 'pids' está vazia
    if [ -z "$pids" ]; then
        echo "Nenhum processo encontrado na porta 5432."
    else
        echo "Matando processos na porta 5432..."
        kill -9 $pids
    fi
}

get_service_name() {
    local app=$1
    case $app in
        luigi) echo "svc/luigi-db-${ENV}-postgresql" ;;
        waluigi) echo "svc/postgres-shared-${ENV}-postgresql" ;;
        # Adicione mais aplicativos aqui
        *)
            echo "Aplicativo desconhecido: $app" >&2
            exit 1
            ;;
    esac
}

# Processamento dos argumentos
ENV=""
NAMESPACE=""
APP=""

while [[ "$#" -gt 0 ]]; do
    case $1 in
        --env) ENV="$2"; shift ;;
        --app) APP="$2"; shift ;;
        *) echo "Argumento desconhecido: $1" >&2; exit 1 ;;
    esac
    shift
done

if [ -z "$ENV" ] || [ -z "$APP" ]; then
    echo "Ambiente ou aplicativo não especificado." >&2
    exit 1
fi

if [ "$ENV" = "stg" ]; then
    NAMESPACE="staging"
else
    NAMESPACE="production"
fi

# Obtenha o nome do serviço
SERVICE_NAME=$(get_service_name $APP)

# Obtenha o nome do serviço
SERVICE_NAME=$(get_service_name $APP)

# Execute o comando kubectl
kill_port_5432
echo "Executando kubectl port-forward para $APP no ambiente $NAMESPACE para o serviço $SERVICE_NAME..."
kubectl port-forward --namespace $NAMESPACE $SERVICE_NAME 5432:5432
