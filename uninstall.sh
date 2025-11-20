#!/bin/bash
# Uninstallation script for bman - Beautiful Man Pages
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

INSTALL_DIR="/usr/local/bin"
SCRIPT_NAME="bman"

# Print colored output
print_header() {
    echo -e "\n${RED}╔════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${RED}║${NC}  ${BOLD}${MAGENTA}🗑️  bman - Uninstaller${NC}                             ${RED}║${NC}"
    echo -e "${RED}╚════════════════════════════════════════════════════════════╝${NC}\n"
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
    print_warning "This script needs ${BOLD}sudo privileges${NC} to uninstall from ${CYAN}$INSTALL_DIR${NC}"
    echo -e "   ${DIM}Please run: ${BOLD}sudo ./uninstall.sh${NC}"
    exit 1
fi

# Check if bman is installed
if [ ! -f "$INSTALL_DIR/$SCRIPT_NAME" ]; then
    print_info "bman is not installed in ${CYAN}$INSTALL_DIR${NC}"
    echo -e "\n${DIM}Nothing to uninstall.${NC}\n"
    exit 0
fi

echo -e "${BOLD}Uninstallation Steps:${NC}\n"

# Get installation info
BMAN_PATH="$INSTALL_DIR/$SCRIPT_NAME"
if [ -f "$BMAN_PATH" ]; then
    BMAN_SIZE=$(ls -lh "$BMAN_PATH" | awk '{print $5}')
    print_info "Found bman at ${CYAN}$BMAN_PATH${NC} (${BMAN_SIZE})"
fi

# Confirm uninstallation
echo ""
print_warning "This will remove bman from your system."
echo -e "   ${DIM}Press Enter to continue or Ctrl+C to cancel...${NC}"
read -r

# Remove the script
echo ""
print_step "Removing bman from ${CYAN}$INSTALL_DIR${NC}..."

if rm -f "$INSTALL_DIR/$SCRIPT_NAME"; then
    print_success "Removed ${CYAN}$INSTALL_DIR/$SCRIPT_NAME${NC}"
else
    print_error "Failed to remove bman"
    echo -e "   ${DIM}You may need to check file permissions${NC}"
    exit 1
fi

# Verify uninstallation
echo ""
print_step "Verifying uninstallation..."

if command -v bman &> /dev/null; then
    REMAINING_PATH=$(which bman)
    print_warning "bman is still accessible at ${CYAN}$REMAINING_PATH${NC}"
    echo -e "   ${DIM}This might be from another installation location${NC}"
    echo -e "   ${DIM}Run: ${BOLD}which bman${NC} ${DIM}to locate it${NC}"
else
    print_success "Uninstallation verified successfully!"
    
    echo -e "\n${GREEN}╔════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║${NC}  ${BOLD}Uninstallation Complete!${NC}                           ${GREEN}║${NC}"
    echo -e "${GREEN}╚════════════════════════════════════════════════════════════╝${NC}\n"
fi

# Note about Python package
echo -e "${BLUE}ℹ${NC}  Note: The ${CYAN}'rich'${NC} Python package was ${BOLD}not${NC} removed."
echo -e "   ${DIM}It may be used by other applications.${NC}"
echo -e "   ${DIM}To remove it manually, run:${NC}"
echo -e "   ${BOLD}pip uninstall rich${NC}\n"

# Goodbye message
echo -e "${DIM}Thank you for using bman! 👋${NC}\n"
