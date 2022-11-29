docker pull portainer/portainer-ce:latest

# Uncomment this line for reinstallation
# docker compose -f ./portainer.compose.yaml down

docker compose -p "portainer" -f ./portainer.compose.yaml --env-file ./.env up -d
