#!/bin/bash

# Start the first process
jupyter notebook --notebook-dir=/src/notebooks --port=8888 --no-browser --ip=0.0.0.0 --allow-root &
sleep 2
FLASK_ENV=development flask run --host=0.0.0.0

# # # Wait for any process to exit
# wait -n

# # # Exit with status of process that exited first
# exit $?

# now we bring the primary process back into the foreground
# and leave it there
# fg %0