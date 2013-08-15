#!/bin/bash
printf "Please select folder:\n"
select d in */; do test -n "$d" && break; echo ">>> Invalid Selection"; done
cd "$d" && pwd
