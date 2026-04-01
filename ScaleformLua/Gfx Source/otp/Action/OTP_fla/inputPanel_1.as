package OTP_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class inputPanel_1 extends MovieClip
    {
        public var labelTitle:Label;
        public var inputPassword:TextInput;
        public var btnOK:Button;
        public var btnCancel:Button;

        public function inputPanel_1()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_labelTitle_inputPanel_Layer6_0();
            this.__setProp_btnCancel_inputPanel_Layer6_0();
            this.__setProp_btnOK_inputPanel_Layer6_0();
            this.__setProp_inputPassword_inputPanel_Layer2_0();
            return;
        }// end function

        function __setProp_labelTitle_inputPanel_Layer6_0()
        {
            try
            {
                this.labelTitle["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelTitle.autoSize = "center";
            this.labelTitle.autoSizeEnable = false;
            this.labelTitle.enabled = true;
            this.labelTitle.text = "";
            this.labelTitle.visible = true;
            try
            {
                this.labelTitle["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnCancel_inputPanel_Layer6_0()
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

        function __setProp_btnOK_inputPanel_Layer6_0()
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

        function __setProp_inputPassword_inputPanel_Layer2_0()
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
            this.inputPassword.editable = false;
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

        function frame1()
        {
            return;
        }// end function

    }
}
