#/usr/bin/env bash
_pass_completions()
{
  if [[ "${COMP_WORDS[1]}" == "-" ]] ; then
    COMPREPLY=($(compgen -W "-list -add -rm -ssh -help" "${COMP_WORDS[1]}"))
  else
    COMPREPLY=($(compgen -W "$(cat $PW_PATH/pw.txt | awk -F ':::::' 'BEGIN { ORS=" " }; {print $1}')" -- "${COMP_WORDS[2]}"))
  fi
}

complete -F _pass_completions pw
