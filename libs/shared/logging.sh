# Logging stuff.
function e_header()   { echo -e "\n\033[1m$@\033[0m"; }
function e_success()  { echo -e "  \033[1;32m✔\033[0m  $@"; }
function e_error()    { echo -e "  \033[1;31m✖\033[0m  $@"; }
function e_warn()     { echo -e "  \033[1;33m  $@\033[0m"; }
function e_arrow()    { echo -e "  \033[1;33m➜\033[0m  $@"; }

function e_ok()       { e_success "ok"; }
# $1 => error message, $2 => exit code
function e_abort()    { e_error $1; exit $2; }
# $1 => warn message
function e_return()    { e_warn $1; }
