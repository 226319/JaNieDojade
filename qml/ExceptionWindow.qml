import QtQuick 2.7
import QtQuick.Controls 2.0
import "WarnWindow" as Warn


Popup {

      width: 400
      height: 200
      modal: true
      focus: true
      closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside
      background: Warn.Background {}
      contentItem: Warn.ContentItem { id: warning }

      function warn(warnStr){
          warning.text = warnStr;
          open();
      }


}
