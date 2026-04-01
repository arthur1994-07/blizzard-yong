package Inventory_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;
    import scaleform.clik.core.*;

    dynamic public class viewBottom_1 extends MovieClip
    {
        public var btnLocker:Button;
        public var btnExtend:Button;
        public var btnTrash:Button;
        public var btnSort:Button;
        public var btnHammer:Button;
        public var labelMoney:Label;
        public var labelPoint:Label;
        public var iconMoney:UIComponent;
        public var iconPoint:UIComponent;

        public function viewBottom_1()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_btnLocker_viewBottom_asset_0();
            this.__setProp_btnExtend_viewBottom_asset_0();
            this.__setProp_btnTrash_viewBottom_asset_0();
            this.__setProp_btnSort_viewBottom_asset_0();
            this.__setProp_btnHammer_viewBottom_asset_0();
            return;
        }// end function

        function __setProp_btnLocker_viewBottom_asset_0()
        {
            try
            {
                this.btnLocker["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnLocker.autoRepeat = false;
            this.btnLocker.autoSize = "none";
            this.btnLocker.enabled = true;
            this.btnLocker.focusable = false;
            this.btnLocker.groupName = "";
            this.btnLocker.label = "";
            this.btnLocker.overlayAlign = "vertical & horizontal";
            this.btnLocker.overlayImg = "icon_locker";
            this.btnLocker.overlayPadding = {x:0, y:0};
            this.btnLocker.selected = false;
            this.btnLocker.toggle = false;
            this.btnLocker.visible = true;
            try
            {
                this.btnLocker["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnExtend_viewBottom_asset_0()
        {
            try
            {
                this.btnExtend["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnExtend.autoRepeat = false;
            this.btnExtend.autoSize = "none";
            this.btnExtend.enabled = true;
            this.btnExtend.focusable = false;
            this.btnExtend.groupName = "";
            this.btnExtend.label = "";
            this.btnExtend.overlayAlign = "vertical & horizontal";
            this.btnExtend.overlayImg = "icon_extend";
            this.btnExtend.overlayPadding = {x:0, y:0};
            this.btnExtend.selected = false;
            this.btnExtend.toggle = false;
            this.btnExtend.visible = true;
            try
            {
                this.btnExtend["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnTrash_viewBottom_asset_0()
        {
            try
            {
                this.btnTrash["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnTrash.autoRepeat = false;
            this.btnTrash.autoSize = "none";
            this.btnTrash.enabled = true;
            this.btnTrash.focusable = false;
            this.btnTrash.groupName = "";
            this.btnTrash.label = "";
            this.btnTrash.overlayAlign = "vertical & horizontal";
            this.btnTrash.overlayImg = "icon_trash";
            this.btnTrash.overlayPadding = {x:0, y:0};
            this.btnTrash.selected = false;
            this.btnTrash.toggle = false;
            this.btnTrash.visible = true;
            try
            {
                this.btnTrash["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnSort_viewBottom_asset_0()
        {
            try
            {
                this.btnSort["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnSort.autoRepeat = false;
            this.btnSort.autoSize = "none";
            this.btnSort.enabled = true;
            this.btnSort.focusable = false;
            this.btnSort.groupName = "";
            this.btnSort.label = "";
            this.btnSort.overlayAlign = "vertical & horizontal";
            this.btnSort.overlayImg = "icon_sort";
            this.btnSort.overlayPadding = {x:0, y:0};
            this.btnSort.selected = false;
            this.btnSort.toggle = false;
            this.btnSort.visible = true;
            try
            {
                this.btnSort["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnHammer_viewBottom_asset_0()
        {
            try
            {
                this.btnHammer["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnHammer.autoRepeat = false;
            this.btnHammer.autoSize = "none";
            this.btnHammer.enabled = true;
            this.btnHammer.focusable = false;
            this.btnHammer.groupName = "";
            this.btnHammer.label = "";
            this.btnHammer.overlayAlign = "vertical & horizontal";
            this.btnHammer.overlayImg = "icon_hammer";
            this.btnHammer.overlayPadding = {x:0, y:0};
            this.btnHammer.selected = false;
            this.btnHammer.toggle = true;
            this.btnHammer.visible = true;
            try
            {
                this.btnHammer["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function frame1()
        {
            return;
        }// end function

    }
}
