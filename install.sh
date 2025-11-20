#!/bin/bash
# Installation script for bman - Beautiful Man Pages
# Version 3.0.0

set -e

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
BOLD='\033[1m'
DIM='\033[2m'
NC='\033[0m' # No Color

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INSTALL_DIR="/usr/local/bin"
SCRIPT_NAME="bman"

# Print colored output
print_header() {
    echo -e "\n${CYAN}╔════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}║${NC}  ${BOLD}${MAGENTA}🎨 bman - Beautiful Man Pages Installer${NC}  ${CYAN}║${NC}"
    echo -e "${CYAN}╚════════════════════════════════════════════════════════════╝${NC}\n"
}

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC}  $1"
}

print_info() {
    echo -e "${BLUE}ℹ${NC}  $1"
}

print_step() {
    echo -e "${CYAN}▸${NC} $1"
}

# Print header
print_header

# Check if running as root/sudo
if [ "$EUID" -ne 0 ]; then 
    print_warning "This script needs ${BOLD}sudo privileges${NC} to install to ${CYAN}$INSTALL_DIR${NC}"
    echo -e "   ${DIM}Please run: ${BOLD}sudo ./install.sh${NC}"
    exit 1
fi

echo -e "${BOLD}Installation Steps:${NC}\n"

# Check Python version
print_step "Checking Python installation..."
if ! command -v python3 &> /dev/null; then
    print_error "Python 3 is required but not installed."
    echo -e "   ${DIM}Please install Python 3 first${NC}"
    exit 1
fi

PYTHON_VERSION=$(python3 --version | cut -d' ' -f2)
PYTHON_MAJOR=$(echo $PYTHON_VERSION | cut -d'.' -f1)
PYTHON_MINOR=$(echo $PYTHON_VERSION | cut -d'.' -f2)

if [ "$PYTHON_MAJOR" -lt 3 ] || [ "$PYTHON_MAJOR" -eq 3 -a "$PYTHON_MINOR" -lt 6 ]; then
    print_error "Python 3.6 or higher is required (found $PYTHON_VERSION)"
    exit 1
fi

print_success "Found Python ${GREEN}$PYTHON_VERSION${NC}"

# Install required Python package
echo ""
print_step "Installing required Python packages..."

# Try to install with pip3 first, then pip
if command -v pip3 &> /dev/null; then
    PIP_CMD="pip3"
elif command -v pip &> /dev/null; then
    PIP_CMD="pip"
else
    print_error "pip is not installed"
    echo -e "   ${DIM}Please install pip first${NC}"
    exit 1
fi

echo -e "   ${DIM}Using $PIP_CMD to install 'rich' package...${NC}"

# Install rich package
if $PIP_CMD install rich --break-system-packages >/dev/null 2>&1; then
    print_success "Installed ${CYAN}rich${NC} package"
elif $PIP_CMD install rich >/dev/null 2>&1; then
    print_success "Installed ${CYAN}rich${NC} package"
else
    print_error "Failed to install ${CYAN}rich${NC} package"
    echo -e "   ${DIM}Try manually: $PIP_CMD install rich${NC}"
    exit 1
fi

# Copy script to install directory
echo ""
print_step "Installing bman to ${CYAN}$INSTALL_DIR${NC}..."

if [ ! -f "$SCRIPT_DIR/$SCRIPT_NAME" ]; then
    print_error "Source file ${CYAN}$SCRIPT_NAME${NC} not found in ${CYAN}$SCRIPT_DIR${NC}"
    exit 1
fi

cp "$SCRIPT_DIR/$SCRIPT_NAME" "$INSTALL_DIR/$SCRIPT_NAME"
chmod +x "$INSTALL_DIR/$SCRIPT_NAME"

print_success "Installed to ${CYAN}$INSTALL_DIR/$SCRIPT_NAME${NC}"

# Verify installation
echo ""
print_step "Verifying installation..."

if command -v bman &> /dev/null; then
    print_success "Installation verified successfully!"
    
    echo -e "\n${GREEN}╔════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║${NC}  ${BOLD}Installation Complete! 🎉${NC}                         ${GREEN}║${NC}"
    echo -e "${GREEN}╚════════════════════════════════════════════════════════════╝${NC}\n"
    
    echo -e "${BOLD}Quick Start Guide:${NC}\n"
    echo -e "  ${CYAN}bman ls${NC}                ${DIM}# View ls documentation${NC}"
    echo -e "  ${CYAN}bman ls -s 'sort'${NC}      ${DIM}# Search for 'sort' in ls${NC}"
    echo -e "  ${CYAN}bman -l git${NC}            ${DIM}# List git-related commands${NC}"
    echo -e "  ${CYAN}bman --help${NC}            ${DIM}# Show all options${NC}\n"
    
    echo -e "${BOLD}Try it now:${NC} ${MAGENTA}bman bman${NC}\n"
    
    # Show installation path
    BMAN_PATH=$(which bman)
    echo -e "${DIM}Installed at: $BMAN_PATH${NC}\n"
else
    echo ""
    print_error "Installation verification failed"
    echo -e "   ${DIM}bman is not in PATH. Check errors above.${NC}"
    exit 1
fi
