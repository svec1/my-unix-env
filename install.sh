git submodule update --init

cd dwm
cp ../dwm-config.h config.h
sudo make clean install

cd dmenu 
cp ../dmenu-config.h config.h
sudo make clean install

cd slstatus 
cp ../slstatus-config.h config.h
sudo make clean install

cd st 
cp ../st-config.h config.h
sudo make clean install
cd ..
