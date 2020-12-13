# Regular Colors     # Bold                # Underline           # Background
Black='\033[0;30m'\  BBlack='\033[1;30m'\  UBlack='\033[4;30m'\  On_Black='\033[40m'\
Red='\033[0;31m'\    BRed='\033[1;31m'\    URed='\033[4;31m'\    On_Red='\033[41m'\
Green='\033[0;32m'\  BGreen='\033[1;32m'\  UGreen='\033[4;32m'\  On_Green='\033[42m'\
Yellow='\033[0;33m'\ BYellow='\033[1;33m'\ UYellow='\033[4;33m'\ On_Yellow='\033[43m'\
Blue='\033[0;34m'\   BBlue='\033[1;34m'\   UBlue='\033[4;34m'\   On_Blue='\033[44m'\
Purple='\033[0;35m'\ BPurple='\033[1;35m'\ UPurple='\033[4;35m'\ On_Purple='\033[45m'\
Cyan='\033[0;36m'\   BCyan='\033[1;36m'\   UCyan='\033[4;36m'\   On_Cyan='\033[46m'\
White='\033[0;37m'\  BWhite='\033[1;37m'\  UWhite='\033[4;37m'\  On_White='\033[47m'\
#
# High Intensty       # Bold High Intensty   # High Intensty backgrounds
IBlack='\033[0;90m'\  BIBlack='\033[1;90m'\  On_IBlack='\033[0;100m'\
IRed='\033[0;91m'\    BIRed='\033[1;91m'\    On_IRed='\033[0;101m'\
IGreen='\033[0;92m'\  BIGreen='\033[1;92m'\  On_IGreen='\033[0;102m'\
IYellow='\033[0;93m'\ BIYellow='\033[1;93m'\ On_IYellow='\033[0;103m'\
IBlue='\033[0;94m'\   BIBlue='\033[1;94m'\   On_IBlue='\033[0;104m'\
IPurple='\033[0;95m'\ BIPurple='\033[1;95m'\ On_IPurple='\033[10;95m'\
ICyan='\033[0;96m'\   BICyan='\033[1;96m'\   On_ICyan='\033[0;106m'\
IWhite='\033[0;97m'\  BIWhite='\033[1;97m'\  On_IWhite='\033[0;107m'\
#
#
echo -e "${BIRed}\nTechnology is grand";
echo "";
echo -e "${BIWhite}\nHello !";
echo -e "${BICyan}\rWelcome to the Termux AIMLDS autoconfig script!";
echo -e "${BIWhite}\rThis will install necessary packages, configs, candy and libraries onto your Android device";
echo -e "${BIWhite}\rso that you can run VSCode Code Server, Jupyter Lab or Viola, and the best Python DS libraries!";
echo -e "${BICyan}"; read -rsn1 -p "Press Enter to continue . . .";

echo -e "${BBlue}\nUpdating Termux Files";
apt update -y
apt upgrade -y
pkg upgrade && pkg update -y
pkg install wget ncurses-utils -y
termux-setup-storage -y
echo "";

echo -e "${BBlue}Installing root-repo";
pkg install root-repo -y
echo "";

echo -e "${BBlue}Installing unstable-repo";
pkg install root-repo -y
echo "";

echo -e "${BBlue}Installing x11-repo";
pkg install x11-repo -y
echo "";

echo -e "${BBlue}Installing science-repo";
pkg install science-repo -y
echo "";

echo -e "${BBlue}Installing game-repo";
pkg install game-repo -y
echo "";

echo -e "${BBlue}Installing it's-pointless repo";
cd ~
$PREFIX/bin/wget https://its-pointless.github.io/setup-pointless-repo.sh
bash setup-pointless-repo.sh
echo "";

echo -e "${BICyan}Updating Termux Files";
apt update -y
apt upgrade -y
pkg upgrade && pkg update -y
echo "";

echo -e "${BICyan}Installing Pre-Req System Packages and Dependencies";
pkg install man help2man doxygen ncurses-utils make cmake autoconf automake valgrind texinfo bison flex -y
pkg upgrade && pkg update -y
pkg install boost clang llvm ctags -y
pkg upgrade && pkg update -y
pkg install patch m4 gcc-10 build-essential xmake ninja vim kakoune python golang erlang elixir rust autoconf c-ares libicu ccnet net-tools netcat netsed nmap roc sdl-net tracepath tshark tsocks wavemon wpa-supplicant tigervnc nodejs-lts yarn jhead jp2a libexpat libexpat-static libjasper libjasper-utils libjpeg-turbo libjpeg-turbo-progs libjpeg-turbo-static openjpeg openjpeg-tools libgfortran5 libgfortran5-9 libpng libpng-static libxml2 libxml2-static libxml2-utils libexpat docbook-xml docbook-xsl html-xml-utils xmake xmlsec xmlsec-static git termux-elf-cleaner perl weechat-perl-plugin openvpn openssl openssl-static openssl-tool lynx elinks python-tkinter python-static xfce4 netsurf xfce4-terminal openbox pypanel xorg-xsetroot ripgrep -y
pkg upgrade && pkg update -y
echo -e "${BIGreen}Install Complete";
echo "";

echo -e "${BBlue}Installing source-highlight";
cd ~
$PREFIX/bin/wget https://www.dropbox.com/s/jlc7mg1jdopiiu6/default.lang?dl=0
mv default.lang?dl=0 default.lang
$PREFIX/bin/wget http://mirrors.ibiblio.org/gnu/ftp/gnu/src-highlite/source-highlight-3.1.9.tar.gz
tar -vxf source-highlight-3.1.9.tar.gz
cd source-highlight-3.1.9
./configure --prefix=/data/data/com.termux/files/usr CXXFLAGS=-I/data/data/com.termux/files/usr/include/boost/ --with-boost-libdir=/data/data/com.termux/files/usr/lib/ --with-doxygen
#./configure --prefix=/data/data/com.termux/files/usr CXXFLAGS=-I/data/data/com.termux/files/usr/include/boost/ --with-boost-libdir=/data/data/com.termux/files/usr/lib/ LDFLAGS=-latimic YYFLAGS=-noyywrap --with-doxygen
make
make install
mv $PREFIX/share/source-highlight/default.lang $PREFIX/share/source-highlight/default.lang.bak
mv ./default.lang $PREFIX/share/source-highlight/
echo -e "${BIGreen}Setup Complete";
echo "";

echo -e "${BBlue}Updating profile";
cd ~
FILE=~/.bashrc
if [ -e "$FILE" ]; then
    echo -e "${BIGreen}.bashrc exists."
    echo 'PATH=/data/data/com.termux/files/usr:$PATH' >> .bashrc
    echo 'export ROOTDIR=/data/data/com.termux/files/usr:$ROOTDIR' >> .bashrc
    echo 'export LESSOPEN="| $PREFIX/bin/src-hilite-lesspipe.sh %s"' >> .bashrc
    echo 'export LESS='\'' -R'\''' >> .bashrc
    echo 'export PS1="\[\033[1;38;5;45m\][\A] \w \$\[\$(tput sgr0)\] "' >> .bashrc
    echo 'alias list="/data/data/com.termux/files/usr/bin/ls -ahisltucLZ"' >> .bashrc
    echo 'alias pip-upgrade-venv="pip freeze | cut -d'\''='\'' -f1 | xargs -n1 pip install -U"' >> .bashrc
    source $FILE
    export
else 
    echo -e "${BIRed}.bashrc does not exist."
    touch .bashrc
    echo 'PATH=/data/data/com.termux/files/usr:$PATH' >> .bashrc
    echo 'export ROOTDIR=/data/data/com.termux/files/usr:$ROOTDIR' >> .bashrc
    echo 'export LESSOPEN="| $PREFIX/bin/src-hilite-lesspipe.sh %s"' >> .bashrc
    echo 'export export LESS=' -R'' >> .bashrc
    echo 'export PS1="\[\033[1;38;5;45m\][\A] \w \$\[$(tput sgr0)\] "' >> .bashrc
    echo 'alias list="/data/data/com.termux/files/usr/bin/ls -ahisltucLZ"' >> .bashrc
    echo 'alias pip-upgrade-venv="pip freeze | cut -d'\''='\'' -f1 | xargs -n1 pip install -U"' >> .bashrc
    source $FILE
    export
fi
echo -e "${BIGreen}Setup Complete";
echo "";

echo -e "${BBlue}Setting Clang as default compiler";
echo -e "${BIBLUE}This can be changed later using the 'setup<compiler>' command";
setupclang
echo -e "${BIGreen}Setup Complete";
echo "";

echo -e "${BIWhite}Installing some pre-reqs to be able to install Python DS, AI and ML Packages";
echo "";

echo -e "${Blue}Installing Python-dev";
apt-get install python-dev -y
echo "";

echo -e "${Blue}Installing fftw";
apt-get install fftw -y
echo "";

echo -e "${Blue}Installing libzmq";
apt-get install libzmq -y
echo "";

echo -e "${Blue}Installing libzmq-dev";
apt-get install libzmq-dev -y
echo "";

echo -e "${Blue}Installing freetype";
apt-get install freetype -y
echo "";

echo -e "${Blue}Installing freetype-dev";
apt-get install freetype-dev -y
echo "";

echo -e "${Blue}Installing libpng-dev";
apt-get install libpng-dev -y
echo "";

echo -e "${Blue}Installing pkg-config";
apt-get install pkg-config -y
echo "";

echo -e "${Blue}Installing openblas";
apt-get install openblas -y
echo "";

echo -e "${Blue}Installing Zlib Zlib-dev";
apt-get install zlib zlib-dev -y
echo ""

echo -e "${Blue}Installing OPEN-CV";
apt-get install opencv -y
echo -e "${BIGreen}Setup Complete";
echo "";

echo -e "${Blue}Installing libhdf5";
apt-get install libhdf5 -y
echo -e "${BIGreen}Setup Complete";
echo "";

echo -e "${BIgreen}Finished installing pre-reqs";
echo "";

echo -e "${Blue}Updating PIP and installing wheel";
pip install -U pip
pip install -U wheel
echo -e "${BIGreen}Setup Complete";
echo "";

echo -e "${Blue}Now installing packages with pip";
echo "";

echo -e "${Blue}Installing BeautifulSoup";
pip install -U BeautifulSoup4
echo -e "${BIGreen}Setup Complete";
echo "";

echo -e "${Blue}Installing Cython";
pip install -U cython
echo -e "${BIGreen}Setup Complete";
echo "";

echo -e "${Blue}Installing Atlas";
pip install -U atlas
echo -e "${BIGreen}Setup Complete";
echo "";

echo -e "${Blue}Installing Pillow";
pip install -U pillow
echo -e "${BIGreen}Setup Complete";
echo "";

echo -e "${Blue}Installing Numpy";
LDFLAGS=" -lm -lcompiler_rt" pip install numpy
echo -e "${BIGreen}Setup Complete";
echo "";

echo -e "${Blue}Installing cppy";
LDFLAGS=" -lm -lcompiler_rt" pip install cppy
echo -e "${BIGreen}Setup Complete";
echo "";

echo -e "${Blue}Installing h5py";
LDFLAGS=" -lm -lcompiler_rt" pip install h5py
echo -e "${BIGreen}Setup Complete";
echo "";

echo -e "${Blue}Installing Keras";
LDFLAGS=" -lm -lcompiler_rt" pip install keras
echo -e "${BIGreen}Setup Complete";
echo "";

echo -e "${Blue}Installing joblib";
pip install -U joblib
echo -e "${BIGreen}Setup Complete";
echo "";

echo -e "${Blue}Installing threadpoolctl";
pip install -U threadpoolctl
echo -e "${BIGreen}Setup Complete";
echo "";

echo -e "${Blue}Installing Sympy";
pip install -U sympy
echo -e "${BIGreen}Setup Complete";
echo "";

echo -e "${BIGreen}Installing Matplotlib";
setupgcc-10
setup-patchforgcc
pip install -U matplotlib
setupclang
echo -e "${Blue}Setup Complete";
echo "";

echo -e "${BIgreen}Installing Pandas";
export CFLAGS="-Wno-deprecated-declarations -Wno-unreachable-code"
LDFLAGS=" -lm -lcompiler_rt" pip install -U pandas
echo -e "${Blue}Setup Complete";
echo "";

echo -e "${BIGreen}Installing Jupyter";
pip install -U jupyterlab notebook voila
echo -e "${Blue}Setup Complete";
echo "";

echo -e "${BIGreen}Installing SciPy";
apt-get install scipy -y
echo -e "${Blue}Setup Complete";
echo "";

echo -e "${BIGreen}Installing Scikit-learn";
setupgcc-10
setup-patchforgcc
pip install -U scikit-learn
setupclang
echo -e "${Blue}Setup Complete";
echo "";

echo -e "${BICyan}Now preparing to install Code-Server";
echo -e "${BIWhite}*NOTE* You will need to configure your package.json here...";
cd ~
yarn init
echo -e "${BIGreen}yarn init complete"; 
echo "";

echo -e "${BICyan}Installing (and reinstalling) packages for Code-Server";
echo -e "${BIWhite}*NOTE* Right now there are issues with getting the right dependencies using just yarn, so bouncing back and forth between yarn and npm to make this work...";
yarn add coder
yarn add applicationinsights
yarn add yauzl
yarn add yazl
yarn add spdlog
yarn global add vscode
yarn global add code-server
yarn global add qiskit
npm install -D
npm install -D mkdirp
npm install -D vscode
npm install -D code-server
npm install -D qiskit
echo -e "${BIGreen}Setup Complete"; 
echo -e "${BICyan}Please run code-server from your command prompt.  See README for further details";
echo"";

echo -e "${Blue}Setting up Elixir's iex interactive shell";
cd ~
$PREFIX/bin/wget https://www.dropbox.com/s/j13pi86ariyn2vq/iex.exs.txt?dl=0
mv iex.exs.txt?dl=0 .iex.exs
echo -e "${BIGreen}Setup Complete"; 
echo "";

echo -e "${Blue}Setting up crates for Rust";
cargo install ripgrep
echo 'PATH=$HOME/.cargo/bin:$PATH' >> .bashrc
echo -e "${BIGreen}Setup Complete"; 
echo "";

echo -e "${Blue}Installing Perl modules";
cpan Log::Log4perl Test::CSV_XS SQL::Statement DBD::File Module::Signature CPAN::Reporter XML::Parser
cpan -r
echo -e "${BIGreen}Setup Complete"; 
echo "";

echo -e "${Blue}Updating Everything";
pkg upgrade && pkg update -y
echo -e "${BIGreen}Setup Complete"; 
echo "";

echo -e "${Blue}Now Running cleanup";
cd ~
rm -rf setup-pointless-repo.sh*
rm -rf source-highlight*
echo -e "${BIGreen}Finished cleanup"
echo "";

echo -e "${BIWhite}\nNext, some helpful instructions :";
echo -e "${BICyan}"; read -rsn1 -p "Press any key to continue . . .";
echo "";

echo -e "${BIWhite}\n To run VSCode Code Server just type in code-server and hit enter";
echo -e "${BIGreen}To run Jupyter Lab just type in jupyterlab and hit enter,";
echo -e "${BIGreen}or if you want, you can run jupyterlab from within the terminal in code-server itself :D ";
echo -e "${BICyan}\nTo upgrade python modules, you can use pip-upgrade-venv (check your .bashrc for aliases) ";
echo "";

