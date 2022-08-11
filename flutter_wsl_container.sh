docker run --rm -it \
-e DISPLAY \
-e WAYLAND_DISPLAY \
-e XDG_RUNTIME_DIR \
-e PULSE_SERVER \
-v $(pwd)/$1:/build \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-v /mnt/wslg:/mnt/wslg \
--device=/dev/kvm \
albertodeduce/flutter-dev:rootless bash
