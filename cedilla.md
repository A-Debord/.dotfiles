

It's because the cedilla module isn't loaded by default when the locale is set to en, so you have to change the configuration files for gtk to add them:

1. Edit configuration files:

```sh
sudo vim /usr/lib/x86_64-linux-gnu/gtk-3.0/3.0.0/immodules.cache

sudo vim /usr/lib/x86_64-linux-gnu/gtk-2.0/2.10.0/immodules.cache
```

On both, find the lines starting with "cedilla" "Cedilla" and add :en to the line. Something like this:

`"cedilla" "Cedilla" "gtk30" "/usr/share/locale" "az:ca:co:fr:gv:oc:pt:sq:tr:wa:en"`

2. Change the Compose file:

```sh
sudo sed -i /usr/share/X11/locale/en_US.UTF-8/Compose -e 's/ć/ç/g' -e 's/Ć/Ç/g'
```
3. Instruct the system to load the cedilla module:

Add those lines to /etc/environment:

```sh
GTK_IM_MODULE=cedilla
QT_IM_MODULE=cedilla
```
Reboot and you are done.
