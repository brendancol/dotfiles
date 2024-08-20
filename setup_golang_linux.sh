#!/bin/bash

# Go version to install
GO_VERSION="1.23"

# Set up directories
mkdir -p "$HOME/go/bin"
mkdir -p "$HOME/go/src"
mkdir -p "$HOME/go/pkg"

# Download and install Go
if ! command -v go &> /dev/null; then
    echo "Go not found. Installing Go $GO_VERSION..."
    curl -OL "https://golang.org/dl/go$GO_VERSION.linux-amd64.tar.gz"
    sudo tar -C /usr/local -xzf "go$GO_VERSION.linux-amd64.tar.gz"
    rm "go$GO_VERSION.linux-amd64.tar.gz"
else
    echo "Go is already installed. Skipping installation."
fi

# Set up Go environment variables
echo "export PATH=\$PATH:/usr/local/go/bin:\$HOME/go/bin" >> "$HOME/.bashrc"
echo "export GOPATH=\$HOME/go" >> "$HOME/.bashrc"
echo "export GOBIN=\$GOPATH/bin" >> "$HOME/.bashrc"

# Source the updated bashrc
source "$HOME/.bashrc"

# Verify Go installation
go version

# Install common Go tools
go install golang.org/x/tools/cmd/goimports@latest
go install golang.org/x/lint/golint@latest

# Set up Go modules
echo "Enabling Go modules..."
go env -w GO111MODULE=on

echo "Go development environment setup complete!"
