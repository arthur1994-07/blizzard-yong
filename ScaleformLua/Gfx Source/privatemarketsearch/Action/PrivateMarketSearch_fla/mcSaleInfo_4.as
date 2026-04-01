package PrivateMarketSearch_fla
{
    import flash.display.*;
    import ran.ui.slot.*;
    import scaleform.clik.controls.*;
    import scaleform.gfx.*;

    dynamic public class mcSaleInfo_4 extends MovieClip
    {
        public var slot:Slot;
        public var input:TextInput;
        public var iconMoney:MovieClip;

        public function mcSaleInfo_4()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_input_mcSaleInfo_textField_0();
            return;
        }// end function

        function __setProp_input_mcSaleInfo_textField_0()
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

        function frame1()
        {
            InteractiveObjectEx.setHitTestDisable(this.iconMoney, true);
            return;
        }// end function

    }
}
