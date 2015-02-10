#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
$DIR/sudo_basic_install.sh
$DIR/sudo_develop_install.sh
$DIR/sudo_full_install.sh
