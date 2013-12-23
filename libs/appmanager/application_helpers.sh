
# Download a file into the specified folder, naming accordingly with param
#
# $url the URL to download
# $filename the name of the downloaded file
#
# Returns the path to the downloaded file

function df_apphelper_download() {
  local url=$1
  local filename=$2

  cd /tmp
  [[ -e $filename ]] || wget $url -O $filename

  echo "/tmp/$filename"
}
