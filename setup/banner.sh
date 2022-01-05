#!/bin/bash

# Print the banner
blue='\033[0;34m'
off='\033[0m'
VERSION=$(cat /opt/VERSION.txt)
echo -e "${blue}"
echo "   ___              ___          ";
echo "  / _ \_    _____  / _ )___ __ __";
echo " / ___/ |/|/ / _ \/ _  / _ \\\ \ /";
echo "/_/   |__,__/_//_/____/\___/_\_\ ($VERSION)";
echo -e "${off}                                 ";