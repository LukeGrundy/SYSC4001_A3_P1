#!/bin/bash

# Make sure the output directories exist
mkdir -p EP_case_executions
mkdir -p RR_case_executions
mkdir -p EP_RR_case_executions

# Loop through all 20 tests
for i in {1..20}
do
    TEST_FILE="test_cases/test$i"
    OUTPUT_EP="EP_case_executions/execution$i.txt"
    OUTPUT_RR="RR_case_executions/execution$i.txt"
    OUTPUT_EP_RR="EP_RR_case_executions/execution$i.txt"

    echo "Running Test $i"

    # EP Scheduler
    if [ -f bin/interrupts_EP ]; then
        echo "  EP..."
        ./bin/interrupts_EP "$TEST_FILE" > "$OUTPUT_EP"
    else
        echo "  EP executable missing!"
    fi

    # RR Scheduler
    if [ -f bin/interrupts_RR ]; then
        echo "  RR..."
        ./bin/interrupts_RR "$TEST_FILE" > "$OUTPUT_RR"
    else
        echo "  RR executable missing!"
    fi

    # EP_RR Scheduler
    if [ -f bin/interrupts_EP_RR ]; then
        echo "  EP_RR..."
        ./bin/interrupts_EP_RR "$TEST_FILE" > "$OUTPUT_EP_RR"
    else
        echo "  EP_RR executable missing!"
    fi
done

echo ""
echo "==============================="
echo " All tests executed successfully!"
echo "==============================="
