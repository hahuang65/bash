# Finds all processes with the given name
function pss() {
  ps aux | grep -i $1 | grep -v grep
}
