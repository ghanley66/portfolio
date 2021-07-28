#!/bin/bash

F1="Apple"
F2="Mango"
F3="Strawberry"
F4="Orange"
F5="Banana"

for i in {1..5}

do
      eval echo "FRUIT: " \$F${i}
done

exit 0