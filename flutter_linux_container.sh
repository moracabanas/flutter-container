docker run --rm -it \
-e DISPLAY \
-e WAYLAND_DISPLAY \
-e XDG_RUNTIME_DIR \
-e PULSE_SERVER \
-v $(pwd)/$1:/flutter/home/projects \
-v /tmp/.X11-unix:/tmp/.X11-unix \
--cap-add=SYS_ADMIN \
--device=/dev/kvm \
--cap-add=SYS_ADMIN \
--shm-size=2g \
albertodeduce/flutter:rootless bash
