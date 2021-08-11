ROOT_PATH=`pwd`

VENDOR_NAME="vendors"
PYTHON="${ROOT_PATH}/${VENDOR_NAME}/bin/python3"
PIP="${ROOT_PATH}/${VENDOR_NAME}/bin/pip3"

install_python3_venv() {
    echo "Install venv"
    OS_TARGET=`uname -s`
	if [ "${OS_TARGET}" == "Linux" ]; then 
		sudo apt-get update
        sudo apt-get install libicu-dev
        sudo apt-get install libpython3-dev python3-dev cython3
		sudo apt-get install python3-venv
        sudo apt-get install python3-pip
	fi

    cd ${ROOT_PATH}
    python3 -m venv ${VENDOR_NAME}
}


activate_venv(){
    echo "active virtual env"
    source ${VENDOR_NAME}/bin/activate
}

install_pip_requirements() {
	echo "Install pip requirements"
	cd ${ROOT_PATH}
	${PYTHON} -m pip install -r requirements.txt
}

install_setup() {
	echo "Install setup"
	cd ${ROOT_PATH}
	${PYTHON} setup.py install
}


clean_up(){
	echo "Cleanup temp"
	cd ${ROOT_PATH}
	rm -rf ${ROOT_PATH}/build
	rm -rf ${ROOT_PATH}/dist

}

install_python3_venv
activate_venv
install_pip_requirements
clean_up
#install_setup