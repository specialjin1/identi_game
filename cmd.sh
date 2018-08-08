#!/bin/bash
set -e
if [ "$ENV" = 'DEV' ]; then
	echo "Running Development Server"
	exec python "main.py"
	# 서버가 돌아간다는 것을 증명
else
	echo "Running Production Server"
	# 실제 돌아갈 파일
	exec uwsgi --http 0.0.0.0:9090 --wsgi-file /app/start.py \
			   --callable app --stats 0.0.0.0:9191
fi
