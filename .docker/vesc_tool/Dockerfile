ARG FROM_TAG="bldc-latest"
FROM vesc-toolchain:${FROM_TAG}

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    qtbase5-private-dev qtscript5-dev \
    qml-module-qt-labs-folderlistmodel qml-module-qtquick-extras \
    qml-module-qtquick-controls2 qtbase5-dev qtchooser qt5-qmake qtbase5-dev-tools libqt5quickcontrols2-5 qtquickcontrols2-5-dev \
    qtcreator qtcreator-doc libqt5serialport5-dev qml-module-qt3d qt3d5-dev \
    qtdeclarative5-dev qtconnectivity5-dev qtmultimedia5-dev qtpositioning5-dev \
    libqt5gamepad5-dev qml-module-qt-labs-settings qml-module-qt-labs-platform libqt5svg5-dev
