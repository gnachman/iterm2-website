ESC="" ##  A literal escape character
ENABLE="${ESC}[?2004h"
DISABLE="${ESC}[?2004l"
SAVED_STTY=$(stty -g)

# NOTE: This returns 0 when you pass it a newline.
ord() {
  printf '%d' "'$1"
}

read_bytes()
{
  dd bs=1 count=$1 2>/dev/null
}

onexit()
{
  printf "%s" "${DISABLE}"
  stty "$SAVED_STTY"
}

expect_ord()
{
  expected="$1"
  c=$(read_bytes 1)
  if [ $(ord "$c") -ne "$expected" ]; then
      printf "Expected ASCII %s but got ASCII %s." "$expected" $(ord "$c")
      exit 1
  fi
}

expect_string()
{
    EXPECT="$1"
    for (( i=0; i<${#EXPECT}; i++ )); do
        expected="${EXPECT:$i:1}"
        expect_ord $(ord "$expected")
    done
}

# Read until newline, die if you see \e
readline_noesc()
{
    c=$(read_bytes 1)
    while [ $(ord "$c") -ne 0 ]; do
        if [ $(ord "$c") -eq 27 ]; then
            echo "Received an unexpected ESC"
            exit 1
        fi
        printf "%s" "$c"
        c=$(read_bytes 1)
    done
}

read_until()
{
    term=$(ord "$1")
    c=$(read_bytes 1)
    n=$(ord "$c")
    while [ $n -ne $term ]; do
        printf "%s" "$c"
        c=$(read_bytes 1)
        n=$(ord "$c")
    done
}

# Initialization
trap onexit EXIT
stty -echo -icanon
printf "%s" "$DISABLE"

# Read normally
echo "Paste bracketing is off. Paste something and press enter."
readline_noesc
echo ""

# Read with bracketing on
printf "%s" "$ENABLE"
echo "Paste bracketing is ON. Paste something and press enter."

expect_string "${ESC}[200~"
printf "[start]"
read_until "${ESC}"
expect_string "[201~"
printf "[end]"
expect_ord 0
echo "$DISABLE"

# Read normally
echo "Paste bracketing is off. Paste something and press enter."
readline_noesc
echo ""

echo "You passed the test."

