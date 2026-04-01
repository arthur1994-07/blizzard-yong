package CharacterCreate_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class charCreate_1 extends MovieClip
    {
        public var styleSelect:MovieClip;
        public var radioClassF:radioClassF_r;
        public var radioSex:radioSex_r;
        public var btns:MovieClip;
        public var radioClassM:radioClassM_r;
        public var radioSchool:radioSchool_r;
        public var labelName:Label;
        public var inputName:TextInput;
        public var tfSchool:Label;
        public var tfSex:Label;
        public var tfClass:Label;
        public var tfDefault:Label;

        public function charCreate_1()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_inputName_charCreate_default_0();
            return;
        }// end function

        function __setProp_inputName_charCreate_default_0()
        {
            try
            {
                this.inputName["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.inputName.defaultText = "";
            this.inputName.displayAsPassword = false;
            this.inputName.editable = true;
            this.inputName.enabled = true;
            this.inputName.focusable = true;
            this.inputName.maxByte = 16;
            this.inputName.maxChars = 0;
            this.inputName.OnlyNumber = false;
            this.inputName.Restrict = "all";
            this.inputName.RestrictAddOn = "";
            this.inputName.text = "";
            this.inputName.textAlign = "left";
            this.inputName.visible = true;
            try
            {
                this.inputName["componentInspectorSetting"] = false;
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
