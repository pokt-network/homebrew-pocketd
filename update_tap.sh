#!/bin/bash

set -e

# Configuration
REPO="pokt-network/poktroll" # GitHub repo in the format owner/repo
FORMULA_FILE="pocketd.rb"    # Homebrew formula file name
ASSET_NAMES=("pocket_darwin_amd64.tar.gz" "pocket_darwin_arm64.tar.gz" "pocket_linux_amd64.tar.gz" "pocket_linux_arm64.tar.gz")

# Get the latest release tag from GitHub API
LATEST_RELEASE=$(curl -s "https://api.github.com/repos/$REPO/releases/latest" | jq -r '.tag_name')
if [ -z "$LATEST_RELEASE" ] || [ "$LATEST_RELEASE" == "null" ]; then
    echo "Failed to fetch the latest release tag. Exiting."
    exit 1
fi

echo "Latest release tag: $LATEST_RELEASE"

# Download release_checksum file
echo "Downloading release_checksum file..."
curl -L -s -o "release_checksum" "https://github.com/$REPO/releases/download/$LATEST_RELEASE/release_checksum" || {
    echo "Failed to download release_checksum file"
    exit 1
}

# Function to fetch SHA256 checksum from release_checksum file
fetch_sha256() {
    local file_name=$1
    local checksum

    # Extract checksum for the specific file
    checksum=$(grep "$file_name" release_checksum | awk '{print $1}')

    if [[ -z "$checksum" ]]; then
        echo "Checksum not found for $file_name in release_checksum file" >&2
        exit 1
    fi

    echo "SHA256 for $file_name: $checksum" >&2
    echo "$checksum"
}

# Update the formula file
update_formula() {
    local asset_name=$1
    local sha256=$2
    local os=$3
    local arch=$4

    echo "Updating formula for $asset_name on $os/$arch..."

    # Determine the correct comment marker for OS and architecture
    if [[ "$os" == "macos" ]]; then
        os_marker="# on_macos_do_not_remove"
    elif [[ "$os" == "linux" ]]; then
        os_marker="# on_linux_do_not_remove"
    else
        echo "Unknown OS: $os"
        exit 1
    fi

    if [[ "$arch" == "intel" ]]; then
        arch_marker="on_intel do"
    elif [[ "$arch" == "arm" ]]; then
        arch_marker="on_arm do"
    else
        echo "Unknown architecture: $arch"
        exit 1
    fi

    # Use sed to update the URL and SHA256 using the markers
    sed -i.bak -E "/$arch_marker.*$os_marker/{
        N; # Move to the next line (url line)
        s#(url \").*#\1$asset_url\"#;
        N; # Move to the next line (sha256 line)
        s#(sha256 \").*#\1$sha256\"#;
    }" "$FORMULA_FILE" || {
        echo "Error updating formula for $os/$arch"
        exit 1
    }
}

# Update the top-level url and sha256
echo "Updating top-level url and sha256..."

# Construct source tarball URL
SOURCE_TARBALL_URL="https://github.com/$REPO/archive/refs/tags/$LATEST_RELEASE.tar.gz"
SOURCE_TARBALL_FILE=$(basename "$SOURCE_TARBALL_URL")

# Download and compute SHA256 for source tarball only
echo "Downloading source tarball and computing its SHA256..."
curl -L -s -o "$SOURCE_TARBALL_FILE" "$SOURCE_TARBALL_URL" || {
    echo "Failed to download source tarball"
    exit 1
}
source_sha256=$(shasum -a 256 "$SOURCE_TARBALL_FILE" | awk '{print $1}')
rm -f "$SOURCE_TARBALL_FILE" # Clean up the downloaded file

# Update the formula file
sed -i.bak -E "
    s#^(  url \").*#\1$SOURCE_TARBALL_URL\"#
    s#^(  sha256 \").*#\1$source_sha256\"#
" "$FORMULA_FILE" || {
    echo "Error updating top-level url and sha256"
    exit 1
}

# Process each asset
for asset_name in "${ASSET_NAMES[@]}"; do
    echo -e "\n ~~ Processing asset: $asset_name ~~"

    # Construct download URL
    asset_url="https://github.com/$REPO/releases/download/$LATEST_RELEASE/$asset_name"

    # Fetch SHA256 from release_checksum file
    sha256=$(fetch_sha256 "$asset_name")

    # Determine OS and Architecture
    case "$asset_name" in
    *darwin*amd64*)
        os="macos"
        arch="intel"
        ;;
    *darwin*arm64*)
        os="macos"
        arch="arm"
        ;;
    *linux*amd64*)
        os="linux"
        arch="intel"
        ;;
    *linux*arm64*)
        os="linux"
        arch="arm"
        ;;
    *)
        echo "Unknown asset type: $asset_name"
        exit 1
        ;;
    esac

    # Update the formula
    update_formula "$asset_name" "$sha256" "$os" "$arch"

    echo -e "~~ Done processing asset: $asset_name ~~\n"
done

echo "Cleaning up temporary files..."
# Remove backup files
rm -f *.bak

echo "Formula updated successfully!"
