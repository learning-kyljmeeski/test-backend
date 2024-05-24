#!/bin/bash

start=$(date +"%s")

ssh -p "${SERVER_PORT}" "${SERVER_USER}"@"${SERVER_HOST}" -i key.txt -t -t -o StrictHostKeyChecking=no << 'ENDSSH'

docker pull learningkyljmeeski/test-backend:0.0.1

cd /home/learning.kyljmeeski/solutions/test_backend

docker-compose down

docker-compose up -d

exit
ENDSSH

if [ $? -eq 0 ]; then
  exit 0
else
  exit 1
fi

end=$(date +"%s")

# shellcheck disable=SC2004
diff=$(($end - $start))

echo "Deployed in : ${diff}s"
