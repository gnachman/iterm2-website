#!/bin/bash

function die() {
  echo "${1}"
  exit 1
}

which printf > /dev/null 2>&1 || die "Shell integration requires the printf binary to be in your path."

SHELL=${SHELL##*/}
URL=""
HOME_PREFIX='${HOME}'
SHELL_AND='&&'
QUOTE=''
if [ "${SHELL}" = tcsh ]
then
  URL="https://iterm2.com/misc/tcsh_startup.in"
  SCRIPT="${HOME}/.login"
  QUOTE='"'
fi
if [ "${SHELL}" = zsh ]
then
  URL="https://iterm2.com/misc/zsh_startup.in"
  SCRIPT="${HOME}/.zshrc"
  QUOTE='"'
fi
if [ "${SHELL}" = bash ]
then
  URL="https://iterm2.com/misc/bash_startup.in"
  test -f "${HOME}/.bash_profile" && SCRIPT="${HOME}/.bash_profile" || SCRIPT="${HOME}/.profile"
  QUOTE='"'
fi
if [ "${SHELL}" = fish ]
then
  echo "Make sure you have fish 2.2 or later. Your version is:"
  fish -v

  URL="https://iterm2.com/misc/fish_startup.in"
  mkdir -p "${HOME}/.config/fish"
  SCRIPT="${HOME}/.config/fish/config.fish"
  HOME_PREFIX='{$HOME}'
  SHELL_AND='; and'
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
echo "Done."
echo ""
echo "The next time you log in, shell integration will be enabled."
