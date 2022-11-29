# Refer to https://docs.docker.com/compose/cli-command/#install-on-linux

function getLatestRelease() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" | # Get latest release from GitHub api
    grep '"tag_name":' |                                            # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/'                                    # Pluck JSON value
}

version="$(getLatestRelease 'docker/compose')"
echo "Latest docker compose version: $version"

# Install for current user only
# targetFolder='~/.docker/cli-plugins/'

# Install for all users
targetFolder='/usr/local/lib/docker/cli-plugins'

mkdir -p $targetFolder
curl -SL "https://github.com/docker/compose/releases/download/$version/docker-compose-$(uname -s)-$(uname -m)" -o $targetFolder/docker-compose
chmod +x $targetFolder/docker-compose

# Test installation, should show version number of docker compose
docker compose version