
function _chromium_canary_current_folder() {
  echo "$appmng_app_dir/$(ls -t $appmng_app_dir | head -n 1)/chrome-linux"
}

function _chromium_canary_download() {
  filename="chromium-canary.zip"
  folder="$appmng_app_dir/$(date +%Y%m%d)"
  url="https://download-chromium.appspot.com/dl/Linux_x64"
  
  file=$(df_apphelper_download $url $filename)

  [[ -e $folder ]] || mkdir $folder

  unzip $file -d $folder

  # needed for Chrome to have it's sandbox
  sudo chown root:root $folder/chrome-linux/chrome_sandbox
  sudo chmod 4755 $folder/chrome-linux/chrome_sandbox
}

function chromium_canary_install() {
  local filename folder version
  e_header "Installing chromium-canary ( 64bit only )"

  _chromium_canary_download

  # Only once, and is ugly, but I couldn't find other methods
  [[ -e "/lib/x86_64-linux-gnu/libudev.so.0" ]] || sudo ln -sf /lib/x86_64-linux-gnu/libudev.so.1 /lib/x86_64-linux-gnu/libudev.so.0

  e_success "Done"
}

function chromium_canary_run() {
  export CHROME_DEVEL_SANDBOX="$(_chromium_canary_current_folder)/chrome_sandbox"

  nohup "$(_chromium_canary_current_folder)/chrome" --user-data-dir=$HOME/.config/chromium-canary ${appmng_cli_args[@]} > /dev/null &
}

function chromium_canary_uninstall() {
  e_header "Uninstalling chromium-canary"  
  
  rm -r $appmng_app_dir

  e_success "Done"
}

function chromium_canary_upgrade() {
  e_header "Upgrading chromium-canary"
  
  _chromium_canary_download

  e_success "Done"
}
