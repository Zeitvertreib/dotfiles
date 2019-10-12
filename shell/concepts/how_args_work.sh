#!/bin/bash

getopts_test(){

  while getopts "abc:" flag; do
         echo "$flag" $OPTIND $OPTARG
  done
  }
  # note that "c:" needs an arg, so we skip fter that
  test
# getopts_test -abc CCC Blank
# /* echo -n "$1" ; echo -n "_as_"; echo $1 */
# /* $1 */
# /* "$1" */
# /* echo done double q as none */
# /* echo -n "`$1`" ; echo -n "_as_" ; echo `$1` */
# /* echo apos */
# /* echo -n "'$1'" ; echo -n "_as_" ; echo '$1' */
# /* echo done double over single as single */
