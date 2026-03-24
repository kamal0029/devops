#!/bin/bash

trap 'echo "$(date) | $(whoami) | Script stopped" >> username_check_result.log; exit' SIGINT

username=$1
errors=""

if [[ ${#username} -lt 5 || ${#username} -gt 15 ]]; then
  errors+="Length must be between 5 and 15 characters\n"
fi

if [[ ! $username =~ ^[a-z] ]]; then
  errors+="Must start with a lowercase letter\n"
fi

if [[ ! $username =~ ^[a-z0-9]+$ ]]; then
  errors+="Only lowercase letters and numbers allowed\n"
fi

if [[ $username =~ [[:space:]] ]]; then
  errors+="Must not contain spaces\n"
fi

if [[ $username =~ [0-9]$ ]]; then
  errors+="Must not end with a number\n"
fi

timestamp=$(date)
current_user=$(whoami)

if [[ -z "$errors" ]]; then
  result="[VALID] Username is valid."
else
  result="[INVALID] Username is invalid.\nMissing:\n- $errors"
fi

echo -e "$result"
echo -e "$timestamp | $current_user | $username\n$result\n" >> username_check_result.log
