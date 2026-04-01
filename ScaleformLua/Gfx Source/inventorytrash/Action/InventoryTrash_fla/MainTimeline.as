package InventoryTrash_fla
{
    import flash.display.*;
    import ran.ui.slot.*;
    import scaleform.clik.controls.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var btnOK:Button;
        public var btnCancel:Button;
        public var slot0:Slot;
        public var slot1:Slot;
        public var slot2:Slot;
        public var slot3:Slot;
        public var slot4:Slot;
        public var slot5:Slot;
        public var label:TextArea;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_btnOK_Scene1_asset_0();
            this.__setProp_btnCancel_Scene1_asset_0();
            this.__setProp_label_Scene1_asset_0();
            return;
        }// end function

        function __setProp_btnOK_Scene1_asset_0()
        {
            try
            {
                this.btnOK["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnOK.autoRepeat = false;
            this.btnOK.autoSize = "none";
            this.btnOK.enabled = true;
            this.btnOK.focusable = false;
            this.btnOK.groupName = "";
            this.btnOK.label = "";
            this.btnOK.overlayAlign = "none";
            this.btnOK.overlayImg = "";
            this.btnOK.overlayPadding = {x:0, y:0};
            this.btnOK.selected = false;
            this.btnOK.toggle = false;
            this.btnOK.visible = true;
            try
            {
                this.btnOK["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnCancel_Scene1_asset_0()
        {
            try
            {
                this.btnCancel["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnCancel.autoRepeat = false;
            this.btnCancel.autoSize = "none";
            this.btnCancel.enabled = true;
            this.btnCancel.focusable = false;
            this.btnCancel.groupName = "";
            this.btnCancel.label = "";
            this.btnCancel.overlayAlign = "none";
            this.btnCancel.overlayImg = "";
            this.btnCancel.overlayPadding = {x:0, y:0};
            this.btnCancel.selected = false;
            this.btnCancel.toggle = false;
            this.btnCancel.visible = true;
            try
            {
                this.btnCancel["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_label_Scene1_asset_0()
        {
            try
            {
                this.label["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.label.defaultText = "";
            this.label.displayAsPassword = false;
            this.label.editable = false;
            this.label.enabled = true;
            this.label.focusable = false;
            this.label.maxByte = 0;
            this.label.maxChars = 0;
            this.label.minThumbSize = 1;
            this.label.OnlyNumber = false;
            this.label.scrollBar = "";
            this.label.text = "휴지통에 버릴 아이템을 선택해주쇼 유저님들";
            this.label.thumbOffset = {top:0, bottom:0};
            this.label.visible = true;
            try
            {
                this.label["componentInspectorSetting"] = false;
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
