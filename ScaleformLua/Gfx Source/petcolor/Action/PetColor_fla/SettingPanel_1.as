package PetColor_fla
{
    import flash.display.*;
    import ran.ui.core.*;
    import scaleform.clik.controls.*;

    dynamic public class SettingPanel_1 extends MovieClip
    {
        public var btnRandom:Button;
        public var btnReset:Button;
        public var btnOK:Button;
        public var btnCancel:Button;
        public var labelName:Label;
        public var colorView:MColorView;

        public function SettingPanel_1()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_colorView_SettingPanel_asset_0();
            this.__setProp_btnRandom_SettingPanel_asset_0();
            this.__setProp_btnReset_SettingPanel_asset_0();
            this.__setProp_btnOK_SettingPanel_asset_0();
            this.__setProp_btnCancel_SettingPanel_asset_0();
            return;
        }// end function

        function __setProp_colorView_SettingPanel_asset_0()
        {
            try
            {
                this.colorView["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.colorView.enabled = true;
            this.colorView.text = "Color1";
            this.colorView.visible = true;
            try
            {
                this.colorView["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnRandom_SettingPanel_asset_0()
        {
            try
            {
                this.btnRandom["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnRandom.autoRepeat = false;
            this.btnRandom.autoSize = "none";
            this.btnRandom.enabled = true;
            this.btnRandom.everyFrameUpdate = true;
            this.btnRandom.focusable = false;
            this.btnRandom.groupName = "";
            this.btnRandom.label = "";
            this.btnRandom.overlayAlign = "none";
            this.btnRandom.overlayImg = "";
            this.btnRandom.overlayPadding = {x:0, y:0};
            this.btnRandom.preventAutoSize = true;
            this.btnRandom.selected = false;
            this.btnRandom.toggle = false;
            this.btnRandom.visible = true;
            try
            {
                this.btnRandom["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnReset_SettingPanel_asset_0()
        {
            try
            {
                this.btnReset["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnReset.autoRepeat = false;
            this.btnReset.autoSize = "none";
            this.btnReset.enabled = true;
            this.btnReset.everyFrameUpdate = true;
            this.btnReset.focusable = false;
            this.btnReset.groupName = "";
            this.btnReset.label = "";
            this.btnReset.overlayAlign = "none";
            this.btnReset.overlayImg = "";
            this.btnReset.overlayPadding = {x:0, y:0};
            this.btnReset.preventAutoSize = true;
            this.btnReset.selected = false;
            this.btnReset.toggle = false;
            this.btnReset.visible = true;
            try
            {
                this.btnReset["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnOK_SettingPanel_asset_0()
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
            this.btnOK.everyFrameUpdate = true;
            this.btnOK.focusable = false;
            this.btnOK.groupName = "";
            this.btnOK.label = "";
            this.btnOK.overlayAlign = "none";
            this.btnOK.overlayImg = "";
            this.btnOK.overlayPadding = {x:0, y:0};
            this.btnOK.preventAutoSize = true;
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

        function __setProp_btnCancel_SettingPanel_asset_0()
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
            this.btnCancel.everyFrameUpdate = true;
            this.btnCancel.focusable = false;
            this.btnCancel.groupName = "";
            this.btnCancel.label = "";
            this.btnCancel.overlayAlign = "none";
            this.btnCancel.overlayImg = "";
            this.btnCancel.overlayPadding = {x:0, y:0};
            this.btnCancel.preventAutoSize = true;
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

        function frame1()
        {
            return;
        }// end function

    }
}
