#!/usr/bin/env bash
# Run inside 2_supercell

OUT=magnetization_table.dat

printf "%-9s %9s %9s %9s\n" "degauss" "2x2x2" "3x3x2" "4x4x2" > $OUT
printf -- "-%.0s" {1..40} >> $OUT; echo >> $OUT

for d in 1 2 4 8; do
  row=$(printf "%-9s" "0.00$d")
  for k in 222 332 442; do
    f=degauss$d/script$k.scf.out
    if [ ! -f "$f" ]; then
      m="n/a"
    else
      m=$(grep 'total magnetization' "$f" | tail -1 | awk '{print $4}')
      [ -z "$m" ] && m="--"
      grep -q "JOB DONE" "$f" || m="$m*"
    fi
    row="$row $(printf '%9s' "$m")"
  done
  echo "$row" >> $OUT
done

echo "" >> $OUT
echo "Total magnetization (Bohr mag/cell)" >> $OUT
echo "* = run did not finish (no JOB DONE): value not reliable" >> $OUT
echo "n/a = file missing" >> $OUT

cat $OUT