#!/bin/bash

# Find all PIDs of iTerm2 processes
PIDS=$(pgrep -x iTerm2)

if [ -z "$PIDS" ]; then
    echo "No running iTerm2 process found."
    exit 1
fi

# If multiple PIDs are found, list them and ask the user to select one
if [[ $(echo "$PIDS" | wc -l) -gt 1 ]]; then
    echo "Multiple iTerm2 processes found. Please select the correct one:"
    echo
    for PID in $PIDS; do
        MEMORY_USAGE=$(ps -o rss= -p "$PID" | awk '{print $1}')
        MEMORY_MB=$((MEMORY_USAGE / 1024))
        echo "PID: $PID, Memory Usage: ${MEMORY_MB} MB"
    done
    echo
    read -p "Enter the PID of the process you want to diagnose: " PID
    if ! echo "$PIDS" | grep -q "^$PID$"; then
        echo "Invalid PID selected. Aborting."
        exit 1
    fi
else
    PID=$PIDS
fi

# Get the memory usage of the selected iTerm2 process
MEMORY_USAGE=$(ps -o rss= -p "$PID" | awk '{print $1}')
MEMORY_MB=$((MEMORY_USAGE / 1024))

echo "iTerm2 process selected with PID: $PID"
echo "Current memory usage: ${MEMORY_MB} MB"

# Confirm with the user
read -p "Proceed with memory diagnostics? This could take a lot of time if memory usage is high, and the output files may be large (several GB). [Y/n]: " CONFIRM
if [[ "$CONFIRM" == "n" || "$CONFIRM" == "N" ]]; then
    echo "Aborting."
    exit 0
fi

# Warn user
echo "Running memory diagnostics. Please be patient..."

# Run the memory diagnostic commands
OUTPUT_DIR="/tmp"
HEAP_FILE="$OUTPUT_DIR/heap.txt"
LEAKS_FILE="$OUTPUT_DIR/leaks.txt"
GRAPH_FILE="$OUTPUT_DIR/graph.memgraph"

# Capture heap information
heap -s -guessNonObjects -showSizes $PID > "$HEAP_FILE"
echo "Heap information written to $HEAP_FILE"

# Capture vmmap information
vmmap $PID >> "$HEAP_FILE" 2>/dev/null
echo "VMMap information appended to $HEAP_FILE"

# Capture leaks information
leaks -nocontext $PID > "$LEAKS_FILE" 2>/dev/null
echo "Leaks information written to $LEAKS_FILE"

# Generate memory graph
leaks -fullStackHistory --outputGraph="$GRAPH_FILE" $PID 2>/dev/null || leaks --outputGraph="$GRAPH_FILE" $PID
echo "Memory graph written to $GRAPH_FILE"

zip /tmp/memory_diagnostics.zip /tmp/heap.txt /tmp/leaks.txt /tmp/graph.memgraph

echo "Diagnostics complete. Attach /tmp/memory_diagnostics.zip to the issue report"
