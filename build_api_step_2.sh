ROOT_PATH=`pwd`

VENDOR_NAME="vendors"
PYTHON="${ROOT_PATH}/${VENDOR_NAME}/bin/python3"
PIP="${ROOT_PATH}/${VENDOR_NAME}/bin/pip3"

activate_venv(){
    echo "active virtual env"
    source ${VENDOR_NAME}/bin/activate
}


run_api_file(){
    echo "run file_api"
    python3 test_api.py
}

activate_venv
run_api_file