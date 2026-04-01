package Login_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var LogInExtend:MovieClip;
        public var btnOK:Button;
        public var btnCancel:Button;
        public var checkSaveID:CheckBox;
        public var labelID:Label;
        public var labelPassword:Label;
        public var labelPassNumber:Label;
        public var checkSaveID_text:Label;
        public var inputID:TextInput;
        public var inputPassword:TextInput;
        public var inputPassNumber:TextInput;
        public var bgDefault:MovieClip;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_labelID_Scene1_asset_0();
            this.__setProp_labelPassword_Scene1_asset_0();
            this.__setProp_inputPassword_Scene1_asset_0();
            this.__setProp_labelPassNumber_Scene1_asset_0();
            this.__setProp_inputPassNumber_Scene1_asset_0();
            this.__setProp_btnOK_Scene1_asset_0();
            this.__setProp_btnCancel_Scene1_asset_0();
            return;
        }// end function

        function __setProp_labelID_Scene1_asset_0()
        {
            try
            {
                this.labelID["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelID.autoSize = "left";
            this.labelID.autoSizeEnable = true;
            this.labelID.enabled = true;
            this.labelID.text = "";
            this.labelID.visible = true;
            try
            {
                this.labelID["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelPassword_Scene1_asset_0()
        {
            try
            {
                this.labelPassword["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelPassword.autoSize = "left";
            this.labelPassword.autoSizeEnable = true;
            this.labelPassword.enabled = true;
            this.labelPassword.text = "";
            this.labelPassword.visible = true;
            try
            {
                this.labelPassword["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_inputPassword_Scene1_asset_0()
        {
            try
            {
                this.inputPassword["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.inputPassword.defaultText = "";
            this.inputPassword.displayAsPassword = true;
            this.inputPassword.editable = true;
            this.inputPassword.enabled = true;
            this.inputPassword.focusable = true;
            this.inputPassword.maxByte = 0;
            this.inputPassword.maxChars = 0;
            this.inputPassword.OnlyNumber = false;
            this.inputPassword.Restrict = "all";
            this.inputPassword.RestrictAddOn = "";
            this.inputPassword.text = "";
            this.inputPassword.textAlign = "left";
            this.inputPassword.visible = true;
            try
            {
                this.inputPassword["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelPassNumber_Scene1_asset_0()
        {
            try
            {
                this.labelPassNumber["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelPassNumber.autoSize = "left";
            this.labelPassNumber.autoSizeEnable = true;
            this.labelPassNumber.enabled = true;
            this.labelPassNumber.text = "";
            this.labelPassNumber.visible = true;
            try
            {
                this.labelPassNumber["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_inputPassNumber_Scene1_asset_0()
        {
            try
            {
                this.inputPassNumber["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.inputPassNumber.defaultText = "";
            this.inputPassNumber.displayAsPassword = true;
            this.inputPassNumber.editable = true;
            this.inputPassNumber.enabled = true;
            this.inputPassNumber.focusable = true;
            this.inputPassNumber.maxByte = 0;
            this.inputPassNumber.maxChars = 0;
            this.inputPassNumber.OnlyNumber = true;
            this.inputPassNumber.Restrict = "number";
            this.inputPassNumber.RestrictAddOn = "";
            this.inputPassNumber.text = "";
            this.inputPassNumber.textAlign = "left";
            this.inputPassNumber.visible = true;
            try
            {
                this.inputPassNumber["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
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

        function frame1()
        {
            return;
        }// end function

    }
}
