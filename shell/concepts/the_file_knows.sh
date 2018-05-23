# schows content of the parent directory
# here for proper bracing

echo dirname
echo $(ls $(dirname ${BASH_SOURCE})/../)
echo ${BASH_SOURCE}
