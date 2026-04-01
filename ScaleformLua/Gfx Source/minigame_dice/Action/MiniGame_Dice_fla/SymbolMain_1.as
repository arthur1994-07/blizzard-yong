package MiniGame_Dice_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class SymbolMain_1 extends MovieClip
    {
        public var mcScene:MovieClip;
        public var textFieldGuide:TextArea;
        public var inputFieldMoney:TextInput;
        public var inputState1:TextInput;
        public var inputState2:TextInput;
        public var iconMoney:MovieClip;

        public function SymbolMain_1()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_inputFieldMoney_SymbolMain_layerStatus_0();
            this.__setProp_inputState2_SymbolMain_layerStatus_0();
            this.__setProp_inputState1_SymbolMain_layerStatus_0();
            this.__setProp_textFieldGuide_SymbolMain_layerStatus_0();
            return;
        }// end function

        function __setProp_inputFieldMoney_SymbolMain_layerStatus_0()
        {
            try
            {
                this.inputFieldMoney["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.inputFieldMoney.defaultText = "";
            this.inputFieldMoney.displayAsPassword = false;
            this.inputFieldMoney.editable = false;
            this.inputFieldMoney.enabled = true;
            this.inputFieldMoney.focusable = false;
            this.inputFieldMoney.maxByte = 0;
            this.inputFieldMoney.maxChars = 0;
            this.inputFieldMoney.OnlyNumber = false;
            this.inputFieldMoney.Restrict = "all";
            this.inputFieldMoney.RestrictAddOn = "";
            this.inputFieldMoney.text = "";
            this.inputFieldMoney.textAlign = "left";
            this.inputFieldMoney.visible = true;
            try
            {
                this.inputFieldMoney["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_inputState2_SymbolMain_layerStatus_0()
        {
            try
            {
                this.inputState2["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.inputState2.defaultText = "";
            this.inputState2.displayAsPassword = false;
            this.inputState2.editable = false;
            this.inputState2.enabled = true;
            this.inputState2.focusable = false;
            this.inputState2.maxByte = 0;
            this.inputState2.maxChars = 0;
            this.inputState2.OnlyNumber = false;
            this.inputState2.Restrict = "all";
            this.inputState2.RestrictAddOn = "";
            this.inputState2.text = "";
            this.inputState2.textAlign = "center";
            this.inputState2.visible = true;
            try
            {
                this.inputState2["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_inputState1_SymbolMain_layerStatus_0()
        {
            try
            {
                this.inputState1["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.inputState1.defaultText = "";
            this.inputState1.displayAsPassword = false;
            this.inputState1.editable = false;
            this.inputState1.enabled = true;
            this.inputState1.focusable = false;
            this.inputState1.maxByte = 0;
            this.inputState1.maxChars = 0;
            this.inputState1.OnlyNumber = false;
            this.inputState1.Restrict = "all";
            this.inputState1.RestrictAddOn = "";
            this.inputState1.text = "";
            this.inputState1.textAlign = "center";
            this.inputState1.visible = true;
            try
            {
                this.inputState1["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_textFieldGuide_SymbolMain_layerStatus_0()
        {
            try
            {
                this.textFieldGuide["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.textFieldGuide.defaultText = "";
            this.textFieldGuide.displayAsPassword = false;
            this.textFieldGuide.editable = false;
            this.textFieldGuide.enabled = true;
            this.textFieldGuide.focusable = false;
            this.textFieldGuide.maxByte = 0;
            this.textFieldGuide.maxChars = 0;
            this.textFieldGuide.minThumbSize = 1;
            this.textFieldGuide.OnlyNumber = false;
            this.textFieldGuide.Restrict = "all";
            this.textFieldGuide.RestrictAddOn = "";
            this.textFieldGuide.scrollBar = "";
            this.textFieldGuide.text = "";
            this.textFieldGuide.textAlign = "left";
            this.textFieldGuide.thumbOffset = {top:0, bottom:0};
            this.textFieldGuide.visible = true;
            try
            {
                this.textFieldGuide["componentInspectorSetting"] = false;
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
