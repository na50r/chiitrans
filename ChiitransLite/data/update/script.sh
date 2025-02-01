#!/bin/bash

# Download JMdict
wget -O JMdict_e.gz "http://ftp.edrdg.org/pub/Nihongo/JMdict_e.gz"

# Download JMnedict
wget -O JMnedict.xml.gz "http://ftp.edrdg.org/pub/Nihongo/JMnedict.xml.gz"

# Extract (gunzip removes .gz automatically)
gunzip -f JMdict_e.gz
gunzip -f JMnedict.xml.gz

# Rename JMdict_e to JMdict.xml for consistency
mv -f JMdict_e JMdict.xml

echo "Dictionaries downloaded and extracted successfully."
