#!/bin/bash
# Publish iTerm2 shell-integration scripts and utilities from the submodule
# to the website.
#
# Two publish paths, sourced from two separate trees in the submodule so
# v1 can keep receiving bug fixes without touching v2 (and vice versa):
#
#   source/shell_integration/        <- legacy URLs (zsh v15, bash v18; the
#                                       pre-OSC-133-k=s scheme that older
#                                       iTerm2 builds understand). Source:
#                                       submodule's shell_integration_v1/.
#
#   source/shell_integration/v2/     <- new URLs (zsh v16, bash v19; emits
#                                       OSC 133;A;k=s around PS2 for issue
#                                       5749). Source: submodule's
#                                       shell_integration/ (current tree).
#
# Utilities are shared between the two versions (no breaking changes
# there) and continue to publish at /utilities/.
mkdir -p source/shell_integration/v2 source/utilities
# Use `find -delete` instead of `rm -f source/shell_integration/*` because
# the latter would warn on the `v2` subdirectory.
find source/shell_integration -maxdepth 1 -type f -delete
rm -f source/shell_integration/v2/*
rm -f source/utilities/*
cp submodules/iTerm2-shell-integration/shell_integration_v1/* source/shell_integration/
cp submodules/iTerm2-shell-integration/shell_integration/*    source/shell_integration/v2/
cp submodules/iTerm2-shell-integration/utilities/*            source/utilities/
