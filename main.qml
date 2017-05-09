import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 1.2

Window {
    visible: true
    width: 900
    height: 600
    title: qsTr("Cover Flow")

    ListModel {
        id: model
        //        ListElement { url: "qrc:/Cover/timg3.jpg" }
        //        ListElement { url: "qrc:/Cover/timg4.jpg" }
        ListElement { url: "qrc:/Cover/jay.jpg" }
        ListElement { url: "qrc:/Cover/timg.jpg" }
        ListElement { url: "qrc:/Cover/timg2.jpg" }
        ListElement { url: "qrc:/Cover/timg3.jpg" }
        ListElement { url: "qrc:/Cover/timg4.jpg" }
    }

    CoverFlow {
        id: mCoverFlow
        anchors.fill: parent
        model: model
        itemCount: 5
    }

    Button {
        id: previous
        width: 68
        text: "Previous"
        anchors {
            bottom: selectIndex.top
            left: parent.left
        }
        onPressedChanged: {
            if (pressed) mCoverFlow.preItem();
        }
    }

    Button {
        id: next
        width: 68
        text: "Next"
        anchors {
            bottom: selectIndex.top
            left: previous.right
        }
        onPressedChanged: {
            if (pressed) mCoverFlow.nextItem();

        }

    }

    TextField {
        id: selectIndex
        anchors {
            bottom: parent.bottom
            left: parent.left
        }
        placeholderText: qsTr("Enter Index")
        onTextChanged: {
            mCoverFlow.toItem(text);
        }
        MouseArea {
            anchors.fill: parent
//            propagateComposedEvents: true
            preventStealing: true
            hoverEnabled: true
            onContainsMouseChanged: {
                console.log("contains mouse ", containsMouse)
                if (!containsMouse) {
                    emptyForFocus.forceActiveFocus()
                }
            }
            onClicked: {
                mouse.accepted = false;
            }
            onPressAndHold: {
                mouse.accepted = false;
            }
            onPressed: {
                mouse.accepted = false;
            }
            onReleased: {
                mouse.accepted = false;
            }
        }

    }
    Rectangle {
        id: emptyForFocus
        width:0
        height: 0
        x: 0
        y: parent.height
    }
}
