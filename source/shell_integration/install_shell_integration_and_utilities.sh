#!/bin/bash
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.


function die() {
  echo "${1}"
  exit 1
}

function join { 
  local IFS="$1";
  shift;
  echo "$*"
}

which printf > /dev/null 2>&1 || die "Shell integration requires the printf binary to be in your path."

UTILITIES=(imgcat imgls it2attention it2check it2copy it2dl it2getvar it2setcolor it2setkeylabel it2ul it2universion)
SHELL=${SHELL##*/}
URL=""
HOME_PREFIX='${HOME}'
SHELL_AND='&&'
QUOTE=''
if [ "${SHELL}" = tcsh ]
then
  URL="https://iterm2.com/shell_integration/tcsh"
  SCRIPT="${HOME}/.login"
  QUOTE='"'
  ALIASES_ARRAY=()
  for U in "${UTILITIES[@]}"
  do
    ALIASES_ARRAY+=("alias $U ~/.iterm2/$U")
  done
  ALIASES=$(join "; " "${ALIASES_ARRAY[@]}")
fi
if [ "${SHELL}" = zsh ]
then
  URL="https://iterm2.com/shell_integration/zsh"
  SCRIPT="${HOME}/.zshrc"
  QUOTE='"'
  ALIASES_ARRAY=()
  for U in "${UTILITIES[@]}"
  do
    ALIASES_ARRAY+=("alias $U=~/.iterm2/$U")
  done
  ALIASES=$(join "; " "${ALIASES_ARRAY[@]}")
fi
if [ "${SHELL}" = bash ]
then
  URL="https://iterm2.com/shell_integration/bash"
  test -f "${HOME}/.bash_profile" && SCRIPT="${HOME}/.bash_profile" || SCRIPT="${HOME}/.profile"
  QUOTE='"'
  ALIASES_ARRAY=()
  for U in "${UTILITIES[@]}"
  do
    ALIASES_ARRAY+=("alias $U=~/.iterm2/$U")
  done
  ALIASES=$(join "; " "${ALIASES_ARRAY[@]}")
fi
if [ "${SHELL}" = fish ]
then
  echo "Make sure you have fish 2.3 or later. Your version is:"
  fish -v

  URL="https://iterm2.com/shell_integration/fish"
  mkdir -p "${HOME}/.config/fish"
  SCRIPT="${HOME}/.config/fish/config.fish"
  HOME_PREFIX='{$HOME}'
  SHELL_AND='; and'
  ALIASES_ARRAY=()
  for U in "${UTILITIES[@]}"
  do
    ALIASES_ARRAY+=("alias $U=~/.iterm2/$U")
  done
  ALIASES=$(join "; " "${ALIASES_ARRAY[@]}")
fi
if [ "${URL}" = "" ]
then
  die "Your shell, ${SHELL}, is not supported yet. Only tcsh, zsh, bash, and fish are supported. Sorry!"
  exit 1
fi

FILENAME="${HOME}/.iterm2_shell_integration.${SHELL}"
RELATIVE_FILENAME="${HOME_PREFIX}/.iterm2_shell_integration.${SHELL}"
echo "Downloading script from ${URL} and saving it to ${FILENAME}..."
curl -SsL "${URL}" > "${FILENAME}" || die "Couldn't download script from ${URL}"
chmod +x "${FILENAME}"
echo "Checking if ${SCRIPT} contains iterm2_shell_integration..."
if ! grep iterm2_shell_integration "${SCRIPT}" > /dev/null 2>&1; then
	echo "Appending source command to ${SCRIPT}..."
	cat <<-EOF >> "${SCRIPT}"

	test -e ${QUOTE}${RELATIVE_FILENAME}${QUOTE} ${SHELL_AND} source ${QUOTE}${RELATIVE_FILENAME}${QUOTE}

EOF
fi

test -d ~/.iterm2 || mkdir ~/.iterm2
for U in "${UTILITIES[@]}"
do
  echo "Downloading $U..."
  curl -SsL "https://iterm2.com/utilities/$U" > ~/.iterm2/$U && chmod +x ~/.iterm2/$U
done
echo "Adding aliases..."
echo "$ALIASES" >> "${FILENAME}"

echo "Done."
echo "--------------------------------------------------------------------------------"
echo ""
echo "The next time you log in, shell integration will be enabled."
echo ""
echo "You will also have these commands:"
echo "imgcat filename"
echo "  Displays the image inline."
echo "imgls"
echo "  Shows a directory listing with image thumbnails"
echo "it2attention start|stop|fireworks"
echo "  Gets your attention"
echo "it2check"
echo "  Checks if the terminal is iTerm2"
echo "it2copy [filename]"
echo "  Copies to the pasteboard"
echo "it2dl filename"
echo "  Downloads the specified file, saving it in your Downloads folder."
echo "it2setcolor ..."
echo "  Changes individual color settings or loads a color preset"
echo "it2setkeylabel ..."
echo "  Changes Touch Bar function key labels"
echo "it2ul"
echo "  Uploads a file"
echo "it2universion"
echo "  Sets the current unicode version"

