sudo pacman -Syu zsh gcc make terminus-font

git submodule update --init

cd dwm
cp ../dwm-config.h config.h
sudo make clean install
cd ..

cd dmenu 
cp ../dmenu-config.h config.h
sudo make clean install
cd ..

cd slstatus 
cp ../slstatus-config.h config.h
sudo make clean install
cd ..

cd st
cp ../st-config.h config.h
curl -O https://st.suckless.org/patches/scrollback/st-scrollback-0.9.2.diff
curl -O https://st.suckless.org/patches/scrollback/st-scrollback-mouse-0.9.2.diff
git apply st-scrollback-0.9.2.diff
git apply st-scrollback-mouse-0.9.2.diff
sudo make clean install
cd ..

cp display,sh ~
cp inet,sh ~
cp .xinirc ~
