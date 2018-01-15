function diskusage() {
  df -lh | grep -v Verf | awk '{print $4 }'>/tmp/diskusage
  sum=0
  for line in $(cat /tmp/diskusage); do
    s=${#line}
    no=${line:0:-1}
    q=${line:$((${s}-1)):$s}
    if [ "$q" = "G" ]; then
      mb=$(($no * 1024))
    else
      mb=$no
    fi
    sum=$(($mb + $sum))

  done
  echo $sum

  rm -f /tmp/diskusage
}
