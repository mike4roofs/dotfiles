# Initialize.
function init_header() { e_header "Sourcing initialization files"; }

function init_do() {
  e_arrow "Sourcing files/init/$(basename $2)"
  source "$2"
}

function init_footer() { e_success "Completed"; }
