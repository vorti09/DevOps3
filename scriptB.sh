#!/bin/bash

while true; do
    sleep $((RANDOM % 6 + 5))
    curl http://localhost &
done

