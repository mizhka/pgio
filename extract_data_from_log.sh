#!/usr/bin/env bash

echo "schemas;threads;riops;ms_per_rio"
awk '/RIOPS/ {print $3";"$5";"$12";"$16}' runit.1.log | sed "s/>//g" | sed "s/<//g"
