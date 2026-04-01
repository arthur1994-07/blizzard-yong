package Lotto_fla
{
    import flash.display.*;
    import flash.text.*;
    import scaleform.clik.controls.*;

    dynamic public class Lotto_Buy_1 extends MovieClip
    {
        public var tfInputNum:TextField;
        public var Quantity:TextField;
        public var ContinuousBuyCount_text:TextField;
        public var tfCost:TextField;
        public var mcAuto:MovieClip;
        public var tfCostStatic:TextField;
        public var input1:TextInput;
        public var input2:TextInput;
        public var input3:TextInput;
        public var input4:TextInput;
        public var input5:TextInput;
        public var input6:TextInput;
        public var ContinuousBuyCount:TextInput;
        public var btnAuto:Button;
        public var btnBuy:Button;
        public var btnContinuousBuy:Button;

        public function Lotto_Buy_1()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_btnAuto_Lotto_Buy_Slot_Button_0();
            this.__setProp_btnBuy_Lotto_Buy_Slot_Button_0();
            this.__setProp_input1_Lotto_Buy_Slot_Button_0();
            this.__setProp_input2_Lotto_Buy_Slot_Button_0();
            this.__setProp_input3_Lotto_Buy_Slot_Button_0();
            this.__setProp_input4_Lotto_Buy_Slot_Button_0();
            this.__setProp_input5_Lotto_Buy_Slot_Button_0();
            this.__setProp_input6_Lotto_Buy_Slot_Button_0();
            this.__setProp_btnContinuousBuy_Lotto_Buy_Slot_Button_0();
            return;
        }// end function

        function __setProp_btnAuto_Lotto_Buy_Slot_Button_0()
        {
            try
            {
                this.btnAuto["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnAuto.autoRepeat = false;
            this.btnAuto.autoSize = "none";
            this.btnAuto.enabled = true;
            this.btnAuto.focusable = false;
            this.btnAuto.groupName = "";
            this.btnAuto.label = "";
            this.btnAuto.overlayAlign = "none";
            this.btnAuto.overlayImg = "";
            this.btnAuto.overlayPadding = {x:0, y:0};
            this.btnAuto.selected = false;
            this.btnAuto.toggle = false;
            this.btnAuto.visible = true;
            try
            {
                this.btnAuto["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnBuy_Lotto_Buy_Slot_Button_0()
        {
            try
            {
                this.btnBuy["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnBuy.autoRepeat = false;
            this.btnBuy.autoSize = "none";
            this.btnBuy.enabled = true;
            this.btnBuy.focusable = false;
            this.btnBuy.groupName = "";
            this.btnBuy.label = "";
            this.btnBuy.overlayAlign = "none";
            this.btnBuy.overlayImg = "";
            this.btnBuy.overlayPadding = {x:0, y:0};
            this.btnBuy.selected = false;
            this.btnBuy.toggle = false;
            this.btnBuy.visible = true;
            try
            {
                this.btnBuy["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_input1_Lotto_Buy_Slot_Button_0()
        {
            try
            {
                this.input1["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.input1.defaultText = "";
            this.input1.displayAsPassword = false;
            this.input1.editable = true;
            this.input1.enabled = true;
            this.input1.focusable = true;
            this.input1.maxByte = 0;
            this.input1.maxChars = 0;
            this.input1.OnlyNumber = false;
            this.input1.Restrict = "number";
            this.input1.RestrictAddOn = "";
            this.input1.text = "";
            this.input1.visible = true;
            try
            {
                this.input1["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_input2_Lotto_Buy_Slot_Button_0()
        {
            try
            {
                this.input2["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.input2.defaultText = "";
            this.input2.displayAsPassword = false;
            this.input2.editable = true;
            this.input2.enabled = true;
            this.input2.focusable = true;
            this.input2.maxByte = 0;
            this.input2.maxChars = 0;
            this.input2.OnlyNumber = false;
            this.input2.Restrict = "number";
            this.input2.RestrictAddOn = "";
            this.input2.text = "";
            this.input2.visible = true;
            try
            {
                this.input2["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_input3_Lotto_Buy_Slot_Button_0()
        {
            try
            {
                this.input3["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.input3.defaultText = "";
            this.input3.displayAsPassword = false;
            this.input3.editable = true;
            this.input3.enabled = true;
            this.input3.focusable = true;
            this.input3.maxByte = 0;
            this.input3.maxChars = 0;
            this.input3.OnlyNumber = false;
            this.input3.Restrict = "number";
            this.input3.RestrictAddOn = "";
            this.input3.text = "";
            this.input3.visible = true;
            try
            {
                this.input3["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_input4_Lotto_Buy_Slot_Button_0()
        {
            try
            {
                this.input4["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.input4.defaultText = "";
            this.input4.displayAsPassword = false;
            this.input4.editable = true;
            this.input4.enabled = true;
            this.input4.focusable = true;
            this.input4.maxByte = 0;
            this.input4.maxChars = 0;
            this.input4.OnlyNumber = false;
            this.input4.Restrict = "number";
            this.input4.RestrictAddOn = "";
            this.input4.text = "";
            this.input4.visible = true;
            try
            {
                this.input4["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_input5_Lotto_Buy_Slot_Button_0()
        {
            try
            {
                this.input5["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.input5.defaultText = "";
            this.input5.displayAsPassword = false;
            this.input5.editable = true;
            this.input5.enabled = true;
            this.input5.focusable = true;
            this.input5.maxByte = 0;
            this.input5.maxChars = 0;
            this.input5.OnlyNumber = false;
            this.input5.Restrict = "number";
            this.input5.RestrictAddOn = "";
            this.input5.text = "";
            this.input5.visible = true;
            try
            {
                this.input5["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_input6_Lotto_Buy_Slot_Button_0()
        {
            try
            {
                this.input6["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.input6.defaultText = "";
            this.input6.displayAsPassword = false;
            this.input6.editable = true;
            this.input6.enabled = true;
            this.input6.focusable = true;
            this.input6.maxByte = 0;
            this.input6.maxChars = 0;
            this.input6.OnlyNumber = false;
            this.input6.Restrict = "number";
            this.input6.RestrictAddOn = "";
            this.input6.text = "";
            this.input6.visible = true;
            try
            {
                this.input6["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnContinuousBuy_Lotto_Buy_Slot_Button_0()
        {
            try
            {
                this.btnContinuousBuy["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnContinuousBuy.autoRepeat = false;
            this.btnContinuousBuy.autoSize = "none";
            this.btnContinuousBuy.enabled = true;
            this.btnContinuousBuy.focusable = false;
            this.btnContinuousBuy.groupName = "";
            this.btnContinuousBuy.label = "연속 자동 구입";
            this.btnContinuousBuy.overlayAlign = "none";
            this.btnContinuousBuy.overlayImg = "";
            this.btnContinuousBuy.overlayPadding = {x:0, y:0};
            this.btnContinuousBuy.selected = false;
            this.btnContinuousBuy.toggle = false;
            this.btnContinuousBuy.visible = true;
            try
            {
                this.btnContinuousBuy["componentInspectorSetting"] = false;
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
