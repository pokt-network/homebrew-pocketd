#!/bin/bash

set -e

# Configuration
REPO="pokt-network/poktroll" # GitHub repo in the format owner/repo
FORMULA_FILE="poktrolld.rb"  # Homebrew formula file name
ASSET_NAMES=("poktroll_darwin_amd64.tar.gz" "poktroll_darwin_arm64.tar.gz" "poktroll_linux_amd64.tar.gz" "poktroll_linux_arm64.tar.gz")

# Get the latest release tag from GitHub API
LATEST_RELEASE=$(curl -s "https://api.github.com/repos/$REPO/releases/latest" | jq -r '.tag_name')
if [ -z "$LATEST_RELEASE" ] || [ "$LATEST_RELEASE" == "null" ]; then
    echo "Failed to fetch the latest release tag. Exiting."
    exit 1
fi

echo "Latest release tag: $LATEST_RELEASE"

# Function to fetch SHA256 checksum
fetch_sha256() {
    local url=$1
    local file_name=$(basename "$url")

    echo "Fetching SHA256 for $url..." >&2

    # Check if file already exists
    if [[ -f "$file_name" ]]; then
        echo "$file_name already exists. Skipping download..." >&2
    else
        echo "Downloading $file_name..." >&2
        curl -L -s -o "$file_name" "$url" || {
            echo "Failed to download $file_name" >&2
            exit 1
        }
    fi

    # Calculate SHA256
    echo "Calculating SHA256 for $file_name..." >&2
    local checksum
    checksum=$(shasum -a 256 "$file_name" | awk '{print $1}')

    # Print the calculated checksum for debugging
    echo "SHA256 for $file_name: $checksum" >&2

    echo "$checksum" # Return the checksum
}

# Update the formula file
update_formula() {
    local asset_name=$1
    local sha256=$2
    local os=$3
    local arch=$4

    echo "Updating formula for $asset_name on $os/$arch..."

    # Determine the correct pattern for OS and architecture
    if [[ "$os" == "macos" ]]; then
        os_pattern="on_macos"
    elif [[ "$os" == "linux" ]]; then
        os_pattern="on_linux"
    else
        echo "Unknown OS: $os"
        exit 1
    fi

    if [[ "$arch" == "intel" ]]; then
        # arch_pattern="on_intel"
        arch_pattern="on_arm"
    elif [[ "$arch" == "arm" ]]; then
        # arch_pattern="on_arm"
        arch_pattern="on_intel"
    else
        echo "Unknown architecture: $arch"
        exit 1
    fi

    echo $os_pattern/$arch_pattern/$asset_name

    # Use sed to update the URL
    sed -i.bak -E "/$os_pattern/,/$arch_pattern/ {
        /url /s#\".*\"#\"https://github.com/$REPO/releases/download/$LATEST_RELEASE/$asset_name\"#
    }" "$FORMULA_FILE" || {
        echo "Error updating URL for $os/$arch"
        exit 1
    }

    # Use sed to update the SHA256
    sed -i.bak -E "/$os_pattern/,/$arch_pattern/ {
        /sha256 /s#\".*\"#\"$sha256\"#
    }" "$FORMULA_FILE" || {
        echo "Error updating SHA256 for $os/$arch"
        exit 1
    }
}
# Process each asset
for asset_name in "${ASSET_NAMES[@]}"; do
    echo -e "\n ~~ Processing asset: $asset_name ~~"

    # Construct download URL
    asset_url="https://github.com/$REPO/releases/download/$LATEST_RELEASE/$asset_name"

    # Fetch SHA256
    sha256=$(fetch_sha256 "$asset_url")

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
rm -f *.bak
# rm -f *.tar.gz *.bak

echo "Formula updated successfully!"
