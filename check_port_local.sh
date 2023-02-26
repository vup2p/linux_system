check_port_local() {
    if [ ! -n $1 ]; then
        echo "Please input port number. Ex: check_port 443"
        exit 1
    fi
    if ss -tulpen | awk '{print $5}' | grep -q ":$1$"; then
        echo -e "\e[31mInstallation is not possible, port $1 already in use.\e[39m"
        exit 1
    else
        echo -e "Port $1 isn't use. You can use"
    fi
}
check_port_local $1
