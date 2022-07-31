#!/usr/bin/env bash

BRANCH_PATH=$(dirname $0)
BRANCH_NAME=$(basename $BRANCH_PATH)
TEMPLATE_PATH=$(dirname $BRANCH_PATH)
TEMPLATE_FILES_PATH=$BRANCH_PATH/files
ROOT_PATH=$(dirname $TEMPLATE_PATH)
error_code=0

if [ -d "$TEMPLATE_FILES_PATH" -a \
     ! -z $(ls -aA $TEMPLATE_FILES_PATH) ];
then
  diff_log_path="/tmp/diff_$(date +%s).log"

  while IFS= read -r file; do
    diff_source="$(realpath $TEMPLATE_FILES_PATH/$file)"
    diff_target="$(realpath $ROOT_PATH/$file)"

    if ! diff $diff_source $diff_target >> $diff_log_path 2>&1;
    then
      error_code=1
      echo ">>> ERROR  :: '$diff_source' and '$diff_target' are not the same."
    fi
  done < <(ls -aA $TEMPLATE_FILES_PATH)
fi

echo ">>> SUCCESS:: '$BRANCH_NAME' template verified."

exit $error_code
