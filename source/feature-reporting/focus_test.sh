ESC="" ##  A literal escape character
ENABLE="${ESC}[?1004h"
DISABLE="${ESC}[?1004l"
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

# Initialization
trap onexit EXIT
stty -echo -icanon

printf "%s" "$ENABLE"
echo "Focus reporting is now on. Cause this terminal to lose focus to continue."

expect_string "${ESC}[O"

echo "Focus lost."
echo "Cause this terminal to gain focus to continue."

expect_string "${ESC}[I"

printf "%s" "$DISABLE"

echo "You passed the test."

