#!/bin/bash
mkdir -p source/shell_integration source/utilities
rm -f source/shell_integration/*
rm -f source/utilities/*
cp submodules/iTerm2-shell-integration/shell_integration/* source/shell_integration/
cp submodules/iTerm2-shell-integration/utilities/* source/utilities/
