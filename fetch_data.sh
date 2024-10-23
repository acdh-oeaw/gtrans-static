# bin/bash

echo "fetching transkriptions from data_repo"
rm -rf data/
curl -LO https://github.com/acdh-oeaw/gtrans-data/archive/refs/heads/main.zip
unzip main

mv ./gtrans-data-main/data/ .

rm main.zip
rm -rf ./gtrans-data-main

echo "fetch imprint"
./shellscripts/dl_imprint.sh
