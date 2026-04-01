package Lotto_fla
{
    import flash.display.*;
    import flash.text.*;
    import ran.ui.slot.*;
    import scaleform.clik.controls.*;
    import scaleform.clik.core.*;

    dynamic public class Lotto_List_8 extends MovieClip
    {
        public var DrawDate:TextField;
        public var num1:MovieClip;
        public var num2:MovieClip;
        public var num3:MovieClip;
        public var num4:MovieClip;
        public var num5:MovieClip;
        public var WinningItemText:TextField;
        public var tfMoney:TextField;
        public var labelTurn:Label;
        public var labelCurCumulateMoney:Label;
        public var labelTime:Label;
        public var labelList:Label;
        public var labelMoneyStatic:Label;
        public var btnRefresh:Button;
        public var btnCheck:Button;
        public var iconMoney:UIComponent;
        public var iconPoint:UIComponent;
        public var stepPage:OptionStepper;
        public var WinningItem:Slot;

        public function Lotto_List_8()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_stepPage_Lotto_List_Slot_0();
            this.__setProp_labelMoneyStatic_Lotto_List_textField_0();
            this.__setProp_btnCheck_Lotto_List_textField_0();
            this.__setProp_labelCurCumulateMoney_Lotto_List_textField_0();
            this.__setProp_btnRefresh_Lotto_List_textField_0();
            return;
        }// end function

        function __setProp_stepPage_Lotto_List_Slot_0()
        {
            try
            {
                this.stepPage["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.stepPage.enabled = true;
            this.stepPage.focusable = false;
            this.stepPage.visible = true;
            try
            {
                this.stepPage["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelMoneyStatic_Lotto_List_textField_0()
        {
            try
            {
                this.labelMoneyStatic["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelMoneyStatic.autoSize = "center";
            this.labelMoneyStatic.enabled = true;
            this.labelMoneyStatic.text = "";
            this.labelMoneyStatic.visible = true;
            try
            {
                this.labelMoneyStatic["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnCheck_Lotto_List_textField_0()
        {
            try
            {
                this.btnCheck["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnCheck.autoRepeat = false;
            this.btnCheck.autoSize = "none";
            this.btnCheck.enabled = true;
            this.btnCheck.focusable = false;
            this.btnCheck.groupName = "";
            this.btnCheck.label = "";
            this.btnCheck.overlayAlign = "none";
            this.btnCheck.overlayImg = "";
            this.btnCheck.overlayPadding = {x:0, y:0};
            this.btnCheck.selected = false;
            this.btnCheck.toggle = false;
            this.btnCheck.visible = true;
            try
            {
                this.btnCheck["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelCurCumulateMoney_Lotto_List_textField_0()
        {
            try
            {
                this.labelCurCumulateMoney["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelCurCumulateMoney.autoSize = "right";
            this.labelCurCumulateMoney.enabled = true;
            this.labelCurCumulateMoney.text = "";
            this.labelCurCumulateMoney.visible = true;
            try
            {
                this.labelCurCumulateMoney["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnRefresh_Lotto_List_textField_0()
        {
            try
            {
                this.btnRefresh["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnRefresh.autoRepeat = false;
            this.btnRefresh.autoSize = "none";
            this.btnRefresh.enabled = true;
            this.btnRefresh.focusable = false;
            this.btnRefresh.groupName = "";
            this.btnRefresh.label = "";
            this.btnRefresh.overlayAlign = "none";
            this.btnRefresh.overlayImg = "";
            this.btnRefresh.overlayPadding = {x:0, y:0};
            this.btnRefresh.selected = false;
            this.btnRefresh.toggle = false;
            this.btnRefresh.visible = true;
            try
            {
                this.btnRefresh["componentInspectorSetting"] = false;
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
