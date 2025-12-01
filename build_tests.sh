#!/bin/bash

# Output directories
EP_OUT="EP_case_executions"
RR_OUT="RR_case_executions"
EPRR_OUT="EP_RR_case_executions"

mkdir -p "$EP_OUT" "$RR_OUT" "$EPRR_OUT"

# Number of tests
NUM_TESTS=20

for i in $(seq 1 $NUM_TESTS); do
    TEST_FILE="test_cases/test$i"

    echo "===== Running Test $i ====="

    #
    # ----- EP scheduler -----
    #
    echo "Running EP on $TEST_FILE"
    ./bin/interrupts_EP "$TEST_FILE"

    if [ -f execution.txt ]; then
        mv execution.txt "$EP_OUT/execution$i.txt"
    else
        echo "!! execution.txt missing after EP test $i"
    fi


    #
    # ----- RR scheduler -----
    #
    echo "Running RR on $TEST_FILE"
    ./bin/interrupts_RR "$TEST_FILE"

    if [ -f execution.txt ]; then
        mv execution.txt "$RR_OUT/execution$i.txt"
    else
        echo "!! execution.txt missing after RR test $i"
    fi


    #
    # ----- EP+RR Hybrid scheduler -----
    #
    echo "Running EP_RR on $TEST_FILE"
    ./bin/interrupts_EP_RR "$TEST_FILE"

    if [ -f execution.txt ]; then
        mv execution.txt "$EPRR_OUT/execution$i.txt"
    else
        echo "!! execution.txt missing after EP_RR test $i"
    fi

    echo "===== Finished Test $i ====="
    echo
done

echo "All tests completed."

