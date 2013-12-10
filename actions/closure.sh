# Scripts executed at the end of all actions

function closure_header() { e_header "Sourcing closure files"; }

function closure_do() {
  e_arrow "Sourcing files/closure/$(basename $2)"
  source "$2"
}

function closure_footer() { e_success "Completed"; }
