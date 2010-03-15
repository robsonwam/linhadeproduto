import mx.controls.Alert;
import mx.core.Application;
import mx.core.IFlexDisplayObject;
import mx.events.MenuEvent;
import mx.managers.PopUpManager;

[Bindable]
private var dskPopUp:IFlexDisplayObject = null;


//Event handler for the MenuBar control's itemClick event.
private function menuItemClick(event:MenuEvent):void
{
	var str:String = "";
	str = "\n event.type   : " + event.type;
	str += "\n event.index  : " + event.index;
	str += "\n Item label   : " + event.item.@label;
	str += "\n Item selected: " + event.item.@toggled;
	str += "\n Item data    : " + event.item.@data;
	str += "\n Item enabled : " + event.item.@enabled;
	str += "\n Item type    : " + event.item.@type;

	if (int(event.item.@data) == -1)
	{
		Application.application.logout();
	}
	else
	{
		//Alert.show(event.item.@data);
		openWindow(int(event.item.@data));
	}
}

private function openWindow(windowIndex:uint, modal:Boolean = true):void
{
	if (windows[windowIndex - 1] != null)
	{
		this.dskPopUp = PopUpManager.createPopUp(this, windows[windowIndex - 1], modal);
		PopUpManager.centerPopUp(this.dskPopUp);
	}
}

private var windows:Array = new Array(
	null //1
	, null //2
	, null //3
	, null //4
//	, br.com.r2jm.sauderesidencia.view.PerfilAcesso //19
	, null);

private function closeWindow():void
{
	PopUpManager.removePopUp(this.dskPopUp);
	this.dskPopUp = null;
}
