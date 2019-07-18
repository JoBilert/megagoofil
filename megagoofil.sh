#!/bin/bash

while [[ $# -gt 0 ]]; do case "${1}" in
    -d)
        DOMAIN="${2}"
        shift 2
        ;;

    -l)
        LIMIT="${2}"
        shift 2
        ;;

    -n)
        DOWNLOADS="${2}"
        shift 2
        ;;

    -o)
        OUTPUT="${2}"
        shift 2
        ;;

    -t)
        FILETYPE="${2}"
        shift 2
        ;;


    *)    # unknown option
        shift # past argument
        ;;

    esac
done

echo "$DOMAIN"
echo "$LIMIT"
echo "$DOWNLOADS"
echo "$OUTPUT"
echo "$FILETYPE"
python3 ~/metagoofil/metagoofil.py -d "$DOMAIN" -l $LIMIT -n $DOWNLOADS -o "$OUTPUT" -t "$FILETYPE"

cd "$OUTPUT"
if [ "$FILETYPE" == 'pdf' ]; then
	for f in *.pdf; do
		echo "Parsing $f"
		docsplit text  --no-ocr "$f"
		docsplit author "$f" >> authors.txt | sort | uniq -i
	done
	for t in *.txt; do
                echo "Searching $t for E-Mail adresses."
		grep -o '[[:alnum:]+\.\_\-]*@[[:alnum:]+\.\_\-]*' "$t" | sort | uniq -i >> emails.txt
        done

fi
