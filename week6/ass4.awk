BEGIN {
  if ($0 ~ /<li><a href="/)
  {
   gsub(/(<h3>|<\/h3>)/,"",$0)
   print $0
  }
 }
