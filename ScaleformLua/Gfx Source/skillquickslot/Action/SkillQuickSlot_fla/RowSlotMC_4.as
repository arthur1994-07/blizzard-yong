package SkillQuickSlot_fla
{
    import flash.display.*;
    import flash.text.*;
    import ran.ui.slot.*;
    import scaleform.clik.controls.*;

    dynamic public class RowSlotMC_4 extends MovieClip
    {
        public var Reserved8:MovieClip;
        public var Reserved9:MovieClip;
        public var Reserved4:MovieClip;
        public var Reserved5:MovieClip;
        public var tf10:TextField;
        public var tf1:TextField;
        public var Reserved6:MovieClip;
        public var tf2:TextField;
        public var Reserved7:MovieClip;
        public var tf3:TextField;
        public var Reserved0:MovieClip;
        public var tf4:TextField;
        public var Reserved1:MovieClip;
        public var tf5:TextField;
        public var Reserved2:MovieClip;
        public var tf6:TextField;
        public var Reserved3:MovieClip;
        public var tf7:TextField;
        public var tf8:TextField;
        public var tf9:TextField;
        public var slot0:Slot;
        public var slot1:Slot;
        public var slot2:Slot;
        public var slot3:Slot;
        public var slot4:Slot;
        public var slot5:Slot;
        public var slot6:Slot;
        public var slot7:Slot;
        public var slot8:Slot;
        public var slot9:Slot;
        public var bg:MovieClip;
        public var btnShortcut:Button;
        public var btnRotate:Button;

        public function RowSlotMC_4()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_btnRotate_RowSlotMC_asset_0();
            this.__setProp_btnShortcut_RowSlotMC_asset_0();
            return;
        }// end function

        function __setProp_btnRotate_RowSlotMC_asset_0()
        {
            try
            {
                this.btnRotate["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnRotate.autoRepeat = false;
            this.btnRotate.autoSize = "none";
            this.btnRotate.enabled = true;
            this.btnRotate.focusable = false;
            this.btnRotate.groupName = "";
            this.btnRotate.label = "";
            this.btnRotate.overlayAlign = "none";
            this.btnRotate.overlayImg = "";
            this.btnRotate.overlayPadding = {x:0, y:0};
            this.btnRotate.selected = false;
            this.btnRotate.toggle = false;
            this.btnRotate.visible = true;
            try
            {
                this.btnRotate["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnShortcut_RowSlotMC_asset_0()
        {
            try
            {
                this.btnShortcut["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnShortcut.autoRepeat = false;
            this.btnShortcut.autoSize = "none";
            this.btnShortcut.enabled = true;
            this.btnShortcut.focusable = false;
            this.btnShortcut.groupName = "";
            this.btnShortcut.label = "";
            this.btnShortcut.overlayAlign = "none";
            this.btnShortcut.overlayImg = "";
            this.btnShortcut.overlayPadding = {x:0, y:0};
            this.btnShortcut.selected = false;
            this.btnShortcut.toggle = false;
            this.btnShortcut.visible = true;
            try
            {
                this.btnShortcut["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function frame1()
        {
            this.tf1.mouseEnabled = false;
            this.tf2.mouseEnabled = false;
            this.tf3.mouseEnabled = false;
            this.tf4.mouseEnabled = false;
            this.tf5.mouseEnabled = false;
            this.tf6.mouseEnabled = false;
            this.tf7.mouseEnabled = false;
            this.tf8.mouseEnabled = false;
            this.tf9.mouseEnabled = false;
            this.tf10.mouseEnabled = false;
            return;
        }// end function

    }
}
