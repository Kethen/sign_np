TAG="sign_np"

set -xe

if ! podman image exists $TAG
then
	podman image build -t $TAG -f Dockerfile
fi

ARGS=$@

podman run \
	--rm -it \
	--security-opt=label=disable \
	-v ./:/work_dir \
	-w /work_dir \
	$TAG \
	bash -c "
	set -xe
	rm ./sign_np
	gcc -static -O2 -o sign_np -I/libkirk libkirk/*.c *.c -lz
	./sign_np $ARGS
"
