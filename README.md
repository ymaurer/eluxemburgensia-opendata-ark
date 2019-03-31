# eluxemburgensia-opendata-ark

Script to extract the ARK identifier from the BNL opendata set
```
# first download the script get_ark_from_issue.sh
# then download the data
curl "https://data.bnl.lu/open-data/digitization/newspapers/export01-newspapers1841-1878.zip" --output papers.zip
unzip papers.zip
cd export01-newspapers1841-1878
find . -type f -name '*.xml' -exec ../get_ark_from_issue.sh '{}' \; > ark2paperid.txt
# then filter by paperid and expand to full ARK of page 4 and urlencode
grep 'lunion' ark2paperid.txt | sort -k 2 | awk '{print "ark:/70795/" $1 "/pages/4"}' | sed 's/\//\%2f/g' > lunion.txt
# expand to full iiif URL
awk '{print "https://iiif.eluxemburgensia.lu/iiif/2/" $1 "/full/full/0/default.jpg" }' lunion.txt > todownload.txt
