#!/bin/bash

# Function to modify a value in php.ini
modify_php_ini() {
    local directive=$1
    local new_value=$2
    local php_ini_path="/etc/php/7.2/fpm/php.ini"  # Adjust the path based on your system

    # Check if php.ini file exists
    if [ -f "$php_ini_path" ]; then
        # Uncomment the line if it is commented
        sed -i "/^\s*;\?\s*$directive\s*=/ s/^\s*;\?\s*//; s/\($directive\s*=\s*\).*/\1$new_value/" "$php_ini_path"
        # Use sed to find and replace the specified directive
        sed -i "s/\($directive\s*=\s*\).*/\1$new_value/" "$php_ini_path"

        echo "Modified $directive to $new_value in $php_ini_path"
    else
        echo "Error: php.ini file not found at $php_ini_path"
    fi
}

# Example usage
modify_php_ini "memory_limit" "256M"
modify_php_ini "max_execution_time" "300"
modify_php_ini "max_input_vars" "3000"
