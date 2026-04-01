package SecondPassword_fla
{
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;
    import scaleform.clik.controls.*;

    dynamic public class inputPanel_1 extends MovieClip
    {
        public var __setPropDict:Dictionary;
        public var __lastFrameProp:int = -1;
        public var labelTitle:Label;
        public var labelInput:Label;
        public var labelReinput:Label;
        public var btnOK:Button;
        public var btnCancel:Button;
        public var inputInput:TextInput;
        public var inputReinput:TextInput;
        public var inputPassword:TextInput;

        public function inputPanel_1()
        {
            this.__setPropDict = new Dictionary(true);
            addFrameScript(0, this.frame1, 9, this.frame10, 10, this.frame11, 19, this.frame20);
            this.__setProp_labelTitle_inputPanel_Layer6_0();
            this.__setProp_btnCancel_inputPanel_Layer6_0();
            this.__setProp_btnOK_inputPanel_Layer6_0();
            addEventListener(Event.FRAME_CONSTRUCTED, this.__setProp_handler, false, 0, true);
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

        function __setProp_inputInput_inputPanel_Layer2_0(param1:int)
        {
            var curFrame:* = param1;
            if (this.inputInput != null && curFrame >= 1 && curFrame <= 10 && (this.__setPropDict[this.inputInput] == undefined || !(int(this.__setPropDict[this.inputInput]) >= 1 && int(this.__setPropDict[this.inputInput]) <= 10)))
            {
                this.__setPropDict[this.inputInput] = curFrame;
                try
                {
                    this.inputInput["componentInspectorSetting"] = true;
                }
                catch (e:Error)
                {
                }
                this.inputInput.defaultText = "";
                this.inputInput.displayAsPassword = true;
                this.inputInput.editable = false;
                this.inputInput.enabled = true;
                this.inputInput.focusable = true;
                this.inputInput.maxByte = 0;
                this.inputInput.maxChars = 0;
                this.inputInput.OnlyNumber = false;
                this.inputInput.Restrict = "all";
                this.inputInput.RestrictAddOn = "";
                this.inputInput.text = "";
                this.inputInput.textAlign = "left";
                this.inputInput.visible = true;
                try
                {
                    this.inputInput["componentInspectorSetting"] = false;
                }
                catch (e:Error)
                {
                }
            }
            return;
        }// end function

        function __setProp_inputReinput_inputPanel_Layer2_0(param1:int)
        {
            var curFrame:* = param1;
            if (this.inputReinput != null && curFrame >= 1 && curFrame <= 10 && (this.__setPropDict[this.inputReinput] == undefined || !(int(this.__setPropDict[this.inputReinput]) >= 1 && int(this.__setPropDict[this.inputReinput]) <= 10)))
            {
                this.__setPropDict[this.inputReinput] = curFrame;
                try
                {
                    this.inputReinput["componentInspectorSetting"] = true;
                }
                catch (e:Error)
                {
                }
                this.inputReinput.defaultText = "";
                this.inputReinput.displayAsPassword = true;
                this.inputReinput.editable = false;
                this.inputReinput.enabled = true;
                this.inputReinput.focusable = true;
                this.inputReinput.maxByte = 0;
                this.inputReinput.maxChars = 0;
                this.inputReinput.OnlyNumber = false;
                this.inputReinput.Restrict = "all";
                this.inputReinput.RestrictAddOn = "";
                this.inputReinput.text = "";
                this.inputReinput.textAlign = "left";
                this.inputReinput.visible = true;
                try
                {
                    this.inputReinput["componentInspectorSetting"] = false;
                }
                catch (e:Error)
                {
                }
            }
            return;
        }// end function

        function __setProp_inputPassword_inputPanel_Layer2_10(param1:int)
        {
            var curFrame:* = param1;
            if (this.inputPassword != null && curFrame >= 11 && curFrame <= 20 && (this.__setPropDict[this.inputPassword] == undefined || !(int(this.__setPropDict[this.inputPassword]) >= 11 && int(this.__setPropDict[this.inputPassword]) <= 20)))
            {
                this.__setPropDict[this.inputPassword] = curFrame;
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
            }
            return;
        }// end function

        function __setProp_handler(param1:Object)
        {
            var _loc_2:* = currentFrame;
            if (this.__lastFrameProp == _loc_2)
            {
                return;
            }
            this.__lastFrameProp = _loc_2;
            this.__setProp_inputInput_inputPanel_Layer2_0(_loc_2);
            this.__setProp_inputReinput_inputPanel_Layer2_0(_loc_2);
            this.__setProp_inputPassword_inputPanel_Layer2_10(_loc_2);
            return;
        }// end function

        function frame1()
        {
            return;
        }// end function

        function frame10()
        {
            stop();
            return;
        }// end function

        function frame11()
        {
            return;
        }// end function

        function frame20()
        {
            stop();
            return;
        }// end function

    }
}
