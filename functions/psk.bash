# Finds a process by partial name and prompts to kill it
function psk() {
  process="$(pss $1 | grep -v 'psk' | head -1)"

  if [[ "$process" == '' ]]; then
    echo "No matching processes found."
    exit
  fi

  process_name="$(echo "$process" | awk '{ s = ""; for (i = 11; i <= NF; i++) s = s $i " "; print s }')"
  process_id="$(echo "$process" | awk '{print $2}')"

  echo -n "Kill $process_name? (y/n): "; read input
  if [[ "$input" == 'y' ]]; then
    echo "Killing $process_name"
    kill -9 "$process_id"
  fi
}
