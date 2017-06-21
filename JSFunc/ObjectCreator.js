
function CreateObject(source, parent, itemAppend ) {
    var comp = Qt.createComponent(source);
    if ( comp.status == Component.Ready ) {
        var itm = comp.createObject(parent);
        return itemAppend(itm, source);
    } else
       warnWindow.warn("fail")
}
