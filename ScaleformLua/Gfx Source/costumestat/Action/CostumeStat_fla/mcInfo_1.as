package CostumeStat_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class mcInfo_1 extends MovieClip
    {
        public var labelTitle:Label;
        public var labelValue:Label;
        public var labelPoint:Label;
        public var input:TextInput;

        public function mcInfo_1()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_input_mcInfo_Layer1_0();
            this.__setProp_labelTitle_mcInfo_Layer1_0();
            this.__setProp_labelValue_mcInfo_Layer1_0();
            this.__setProp_labelPoint_mcInfo_Layer1_0();
            return;
        }// end function

        function __setProp_input_mcInfo_Layer1_0()
        {
            try
            {
                this.input["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.input.defaultText = "";
            this.input.displayAsPassword = false;
            this.input.editable = true;
            this.input.enabled = true;
            this.input.focusable = true;
            this.input.maxByte = 0;
            this.input.maxChars = 0;
            this.input.OnlyNumber = false;
            this.input.Restrict = "number";
            this.input.RestrictAddOn = "";
            this.input.text = "";
            this.input.textAlign = "left";
            this.input.visible = true;
            try
            {
                this.input["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelTitle_mcInfo_Layer1_0()
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

        function __setProp_labelValue_mcInfo_Layer1_0()
        {
            try
            {
                this.labelValue["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelValue.autoSize = "center";
            this.labelValue.autoSizeEnable = false;
            this.labelValue.enabled = true;
            this.labelValue.text = "";
            this.labelValue.visible = true;
            try
            {
                this.labelValue["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelPoint_mcInfo_Layer1_0()
        {
            try
            {
                this.labelPoint["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelPoint.autoSize = "center";
            this.labelPoint.autoSizeEnable = false;
            this.labelPoint.enabled = true;
            this.labelPoint.text = "";
            this.labelPoint.visible = true;
            try
            {
                this.labelPoint["componentInspectorSetting"] = false;
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
