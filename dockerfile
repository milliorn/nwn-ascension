FROM squattingmonk/nasher:latest
ADD . /Build
WORKDIR /Build
RUN nasher config --nssFlags:'-n /nwn/data -o' && nasher pack