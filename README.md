# Flutter container developement (WSL compatible)

This repo allows to develop Flutter applications on a container.
You can also run the application on a desktop environment with the appropriate WSL script.

### Requirements
- Docker
- WSL or full linux environment

## Usage

```bash
./flutter_linux_container.sh #for Linux desktops

./flutter_wsl_container.sh   #for WSL desktops
```
then **inside the container** you can create a project with:

```bash
flutter@aa1be5030283:~/projects/$ ./create_app.sh
```
or   
```bash
flutter@container:~/projects/$ cd <your-project-path>
flutter@container:~/projects/$ flutter clean
flutter@container:~/projects/$ flutter pub get
flutter@container:~/projects/$ flutter run
```


## Extra

You can use built in Android Studio GUI by typing `studio` on the container terminal.

## TODO

[x] Rootless container (require non root Flutter instalation Flutter reinstall)  
[x] Hot reloading not working (press r to reload while in `flutter run`)  
[x] Add support for kvm android emulator (requires kvm installed)  
[ ] Test image on plain linux  
[ ] Add android studio basic headless setup  


## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)
