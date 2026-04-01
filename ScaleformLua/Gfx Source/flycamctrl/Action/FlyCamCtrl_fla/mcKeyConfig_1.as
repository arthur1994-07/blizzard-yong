package FlyCamCtrl_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class mcKeyConfig_1 extends MovieClip
    {
        public var comboType:DropdownMenu;
        public var inputPosX:TextInput;
        public var inputPosY:TextInput;
        public var inputPosZ:TextInput;
        public var btnCurPos:Button;
        public var btnSave:Button;

        public function mcKeyConfig_1()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_comboType_mcKeyConfig_asset_0();
            this.__setProp_btnSave_mcKeyConfig_asset_0();
            this.__setProp_btnCurPos_mcKeyConfig_asset_0();
            return;
        }// end function

        function __setProp_comboType_mcKeyConfig_asset_0()
        {
            try
            {
                this.comboType["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.comboType.autoSize = "none";
            this.comboType.dropdown = "DefaultScrollingList";
            this.comboType.enabled = true;
            this.comboType.focusable = false;
            this.comboType.groupName = "";
            this.comboType.itemRenderer = "DefaultListItemRenderer";
            this.comboType.menuDirection = "down";
            this.comboType.menuMargin = 1;
            this.comboType.inspectableMenuOffset = {top:0, right:0, bottom:0, left:0};
            this.comboType.inspectableMenuPadding = {top:0, right:0, bottom:0, left:0};
            this.comboType.menuRowCount = 5;
            this.comboType.menuRowsFixed = true;
            this.comboType.menuWidth = -1;
            this.comboType.menuWrapping = "normal";
            this.comboType.overlayAlign = "none";
            this.comboType.overlayImg = "";
            this.comboType.overlayPadding = {x:0, y:0};
            this.comboType.preventAutoSize = true;
            this.comboType.scrollBar = "DefaultScrollBar";
            this.comboType.inspectableThumbOffset = {top:0, bottom:0};
            this.comboType.visible = true;
            try
            {
                this.comboType["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnSave_mcKeyConfig_asset_0()
        {
            try
            {
                this.btnSave["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnSave.autoRepeat = false;
            this.btnSave.autoSize = "none";
            this.btnSave.enabled = true;
            this.btnSave.focusable = false;
            this.btnSave.groupName = "";
            this.btnSave.label = "Save";
            this.btnSave.overlayAlign = "none";
            this.btnSave.overlayImg = "";
            this.btnSave.overlayPadding = {x:0, y:0};
            this.btnSave.preventAutoSize = true;
            this.btnSave.selected = false;
            this.btnSave.toggle = false;
            this.btnSave.visible = true;
            try
            {
                this.btnSave["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnCurPos_mcKeyConfig_asset_0()
        {
            try
            {
                this.btnCurPos["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnCurPos.autoRepeat = false;
            this.btnCurPos.autoSize = "none";
            this.btnCurPos.enabled = true;
            this.btnCurPos.focusable = false;
            this.btnCurPos.groupName = "";
            this.btnCurPos.label = "Cur Pos";
            this.btnCurPos.overlayAlign = "none";
            this.btnCurPos.overlayImg = "";
            this.btnCurPos.overlayPadding = {x:0, y:0};
            this.btnCurPos.preventAutoSize = true;
            this.btnCurPos.selected = false;
            this.btnCurPos.toggle = false;
            this.btnCurPos.visible = true;
            try
            {
                this.btnCurPos["componentInspectorSetting"] = false;
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
