# After installation tips

List of things you may want to change.

## Localization

If you haven't configured your keyboard and language.

### Keyboard layout

If the layout of your keyboard don't match the X11 settings:
- View current settings
    ```shell
    setxkbmap -print -verbose 10 # or
    localectl
    ```
- Check available settings
    ```shell
    localectl list-x11-keymap-models
    localectl list-x11-keymap-layouts
    localectl list-x11-keymap-variants [layout]
    localectl list-x11-keymap-options
    ```
- You can change the settings for your current X session
    ```shell
    setxkbmap -model pc105 -layout latam -variant deadtilde
    ```
- You can make permanent changes changing the X11 config files with:
    ```shell
    localectl --no-convert set-x11-keymap latam pc105 deadtilde
    ```
Any previous change can be overwritten by other tools like `fcitx5`.

### Language

- Uncomment the locales on `/etc/locale.gen` file that you want to be available.
- Run
	```shell
	sudo locale-gen
	```
- Edit `/etc/locale.conf` file to set the language, you can set multiple variables.
	```
	LANG="es_MX.UTF-8"
	LC_CTYPE='en_US.UTF-8'
	LC_MESSAGES='en_US.UTF-8'
	LC_TIME='ja_JP.UTF-8'
	```

## Themes

You can change the color, cursor and icon themes opening the `lxappearance` program.

## Default applications

If yu don't like the default applications open the Xfce `Default Applications` program and you'll be able to change the defaults of: web browser, mail reader, file manager and terminal emulator.

## Familiarize with the shortcuts

Some relevant shortcuts.

| Keyboard shortcut  |          Action           |               
| ------------------ | ------------------------- |
| Super + Shift + R  | Reconfigure Openbox       |
| Super + Q          | Quit program              |
| Ctrl + Space       | Launch Rofi               |
| Ctrl + Alt + K     | Launch screenlock         |
| Ctrl + Alt + L     | Launch screenlock         |
| Super + X          | Launch screenlock         |
| Super + H          | Launch htop               |
| Super + W          | Default web browser       |
| Super + M          | Default mail reader       |
| Super + F          | Default file manager      |
| Super + T          | Default terminal emulator |
| Ctrl + Alt + Enter | Default terminal emulator |
| Ctrl + Alt + T     | alacritty -e tmux         |
| Ctrl + Alt + O     | Toggle picom              |
| Super + Esc        | xkill                     |
| F10                | Toggle dropdown terminal  |
| Alt + R            | Resize window             |
| Ctrl + Alt + Left  | Move to desktop left      |
| Ctrl + Alt + Right | Move to desktop right     |