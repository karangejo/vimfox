mkfifo ppipe
python3 -m FoxDot -p < ppipe &
pid=$!
sleep infinity > ppipe &
echo -e "foxdot command\n\n" > ppipe
kill -9 pid
