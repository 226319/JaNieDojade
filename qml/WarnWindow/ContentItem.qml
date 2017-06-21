import QtQuick 2.0

Rectangle {
              property alias text: warning.text
              color:Qt.lighter("#0b75c6");

              Text{
                  id: warning
                  text: "Warning"
                  width: parent.width - 20
                  height: parent.height - 20
                  horizontalAlignment: Text.AlignHCenter
                  verticalAlignment: Text.AlignVCenter
                  wrapMode: Text.Wrap
                  font.pixelSize: 17
              }
}
