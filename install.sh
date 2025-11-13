sudo pacman -Syu zsh gcc make terminus-font

git submodule update --init

if [ "$1" == "openbsd" ]; then
	echo "Was choose openbsd cfg."
	cp openbsd_configs_make/dwm.mk dwm/config.mk
	cp openbsd_configs_make/dmenu.mk dmenu/config.mk
	cp openbsd_configs_make/slstatus.mk slstatus/config.mk
	cp openbsd_configs_make/st.mk st/config.mk
elif [ "$1" != "linux" ]; then
	echo "Undefined cfg."
	exit 1
fi

if [ "$2" == "full" ]; then
	echo "Was choose full cfg."
	echo "---BYEDPI BUILDING---"

	cd byedpi
	sudo make clean install
	cd ..

	cp display.sh ~
	cp inet.sh ~
fi

echo "---DWM BUILDING---"

cd dwm
cp ../dwm-config.h config.h
sudo make clean install
cd ..

echo "---DMENU BUILDING---"

cd dmenu 
cp ../dmenu-config.h config.h
sudo make clean install
cd ..

echo "---SLSTATUS BUILDING---"

cd slstatus 
cp ../slstatus-config.h config.h
sudo make clean install
cd ..

echo "---ST BUILDING---"

cd st
cp ../st-config.h config.h
curl -O https://st.suckless.org/patches/scrollback/st-scrollback-0.9.2.diff
curl -O https://st.suckless.org/patches/scrollback/st-scrollback-mouse-0.9.2.diff
git apply st-scrollback-0.9.2.diff
git apply st-scrollback-mouse-0.9.2.diff
sudo make clean install
cd ..

cp .xinitrc ~
