#!/bin/bash

function die() {
  echo "${1}"
  exit 1
}

which printf > /dev/null 2>&1 || die "Shell integration requires the printf binary to be in your path."

SHELL=$(echo "${SHELL}" | tr / "\n" | tail -1)
URL=""
if [ "${SHELL}" == tcsh ]
then
  URL="http://iterm2.com/misc/tcsh_startup.in"
  SCRIPT="${HOME}/.tcshrc"
fi
if [ "${SHELL}" == zsh ]
then
  URL="http://iterm2.com/misc/zsh_startup.in"
  SCRIPT="${HOME}/.zshrc"
fi
if [ "${SHELL}" == bash ]
then
  URL="http://iterm2.com/misc/bash_startup.in"
  test -f "${HOME}/.bash_profile" && SCRIPT="${HOME}/.bash_profile" || SCRIPT="${HOME}/.profile"
fi
if [ `basename "${SHELL}"` == fish ]
then
  echo "Fish support is nascent. You need a version of fish newer than 2.1.1 (so you probably need to build it yourself). Your version is:"
  fish -v
  echo "FYI, version 2.1.1 has a bug where long lines wrap prematurely."

  URL="http://iterm2.com/misc/fish_startup.in"
  mkdir -p "${HOME}/.config/fish"
  SCRIPT="${HOME}/.config/fish/config.fish"
fi
if [ "${URL}" == "" ]
then
  die "Your shell, ${SHELL}, is not supported yet. Only tcsh, zsh, bash, and fish are supported. Sorry!"
  exit 1
fi

FILENAME="${HOME}/.iterm2_shell_integration.${SHELL}"
echo "Downloading script from ${URL} and saving it to ${FILENAME}..."
curl -L "${URL}" > "${FILENAME}" || die "Couldn't download script from ${URL}"
chmod +x "${FILENAME}"
echo "Checking if ${SCRIPT} contains iterm2_shell_integration..."
grep iterm2_shell_integration "${SCRIPT}" > /dev/null 2>&1 || (echo "Appending source command to ${SCRIPT}..."; echo "" >> "${SCRIPT}"; echo "source ${FILENAME}" >> "${SCRIPT}")
echo "Done."
echo ""
echo "The next time you log in, shell integration will be enabled."
