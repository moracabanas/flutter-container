docker run --rm -it \
-e DISPLAY \
-e WAYLAND_DISPLAY \
-e XDG_RUNTIME_DIR \
-e PULSE_SERVER \
-v $(pwd)/$1:/home/flutter/projects \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-v /mnt/wslg:/mnt/wslg \
--device=/dev/kvm \
--cap-add=SYS_ADMIN \
--shm-size=2g \
albertodeduce/flutter:rootless bash
