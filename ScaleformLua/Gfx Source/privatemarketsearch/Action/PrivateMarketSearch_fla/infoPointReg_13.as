package PrivateMarketSearch_fla
{
    import flash.display.*;
    import ran.ui.slot.*;
    import scaleform.clik.controls.*;

    dynamic public class infoPointReg_13 extends MovieClip
    {
        public var labelItem:Label;
        public var labelGameMoney:Label;
        public var labelType:Label;
        public var labelPrice:Label;
        public var lableCount:Label;
        public var labelTime1:Label;
        public var labelTime2:Label;
        public var labelRegCostStatic:Label;
        public var labelRegCost:Label;
        public var labelCommission:Label;
        public var labelMoney:Label;
        public var lablePoint:Label;
        public var slot:Slot;
        public var comboGameMoney:DropdownMenu;
        public var inputPrice:TextInput;
        public var inputCount:TextInput;
        public var comboTime:DropdownMenu;
        public var btnReset:Button;
        public var btnReg:Button;
        public var checkPoint:CheckBox;
        public var checkPoint_text:Label;

        public function infoPointReg_13()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_labelItem_infoPointReg_label_0();
            this.__setProp_labelCommission_infoPointReg_label_0();
            this.__setProp_labelMoney_infoPointReg_label_0();
            this.__setProp_lablePoint_infoPointReg_label_0();
            this.__setProp_labelRegCost_infoPointReg_label_0();
            this.__setProp_comboGameMoney_infoPointReg_combo_0();
            this.__setProp_comboTime_infoPointReg_combo_0();
            this.__setProp_inputPrice_infoPointReg_input_0();
            this.__setProp_inputCount_infoPointReg_input_0();
            this.__setProp_btnReset_infoPointReg_btn_0();
            this.__setProp_btnReg_infoPointReg_btn_0();
            return;
        }// end function

        function __setProp_labelItem_infoPointReg_label_0()
        {
            try
            {
                this.labelItem["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelItem.autoSize = "right";
            this.labelItem.enabled = true;
            this.labelItem.text = "";
            this.labelItem.visible = true;
            try
            {
                this.labelItem["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelCommission_infoPointReg_label_0()
        {
            try
            {
                this.labelCommission["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelCommission.autoSize = "right";
            this.labelCommission.enabled = true;
            this.labelCommission.text = "";
            this.labelCommission.visible = true;
            try
            {
                this.labelCommission["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelMoney_infoPointReg_label_0()
        {
            try
            {
                this.labelMoney["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelMoney.autoSize = "left";
            this.labelMoney.enabled = true;
            this.labelMoney.text = "";
            this.labelMoney.visible = true;
            try
            {
                this.labelMoney["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_lablePoint_infoPointReg_label_0()
        {
            try
            {
                this.lablePoint["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.lablePoint.autoSize = "left";
            this.lablePoint.enabled = true;
            this.lablePoint.text = "";
            this.lablePoint.visible = true;
            try
            {
                this.lablePoint["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelRegCost_infoPointReg_label_0()
        {
            try
            {
                this.labelRegCost["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelRegCost.autoSize = "left";
            this.labelRegCost.enabled = true;
            this.labelRegCost.text = "";
            this.labelRegCost.visible = true;
            try
            {
                this.labelRegCost["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_comboGameMoney_infoPointReg_combo_0()
        {
            try
            {
                this.comboGameMoney["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.comboGameMoney.autoSize = "none";
            this.comboGameMoney.dropdown = "DefaultScrollingList";
            this.comboGameMoney.enabled = true;
            this.comboGameMoney.focusable = false;
            this.comboGameMoney.groupName = "";
            this.comboGameMoney.itemRenderer = "DefaultListItemRenderer";
            this.comboGameMoney.menuDirection = "down";
            this.comboGameMoney.menuMargin = 0;
            this.comboGameMoney.inspectableMenuOffset = {top:0, right:0, bottom:0, left:0};
            this.comboGameMoney.inspectableMenuPadding = {top:0, right:0, bottom:0, left:0};
            this.comboGameMoney.menuRowCount = 5;
            this.comboGameMoney.menuRowsFixed = false;
            this.comboGameMoney.menuWidth = -1;
            this.comboGameMoney.menuWrapping = "normal";
            this.comboGameMoney.overlayAlign = "none";
            this.comboGameMoney.overlayImg = "";
            this.comboGameMoney.overlayPadding = {x:0, y:0};
            this.comboGameMoney.scrollBar = "DefaultScrollBar";
            this.comboGameMoney.inspectableThumbOffset = {top:0, bottom:0};
            this.comboGameMoney.visible = true;
            try
            {
                this.comboGameMoney["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_comboTime_infoPointReg_combo_0()
        {
            try
            {
                this.comboTime["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.comboTime.autoSize = "none";
            this.comboTime.dropdown = "DefaultScrollingList";
            this.comboTime.enabled = true;
            this.comboTime.focusable = false;
            this.comboTime.groupName = "";
            this.comboTime.itemRenderer = "DefaultListItemRenderer";
            this.comboTime.menuDirection = "down";
            this.comboTime.menuMargin = 0;
            this.comboTime.inspectableMenuOffset = {top:0, right:0, bottom:0, left:0};
            this.comboTime.inspectableMenuPadding = {top:0, right:0, bottom:0, left:0};
            this.comboTime.menuRowCount = 5;
            this.comboTime.menuRowsFixed = true;
            this.comboTime.menuWidth = -1;
            this.comboTime.menuWrapping = "normal";
            this.comboTime.overlayAlign = "none";
            this.comboTime.overlayImg = "";
            this.comboTime.overlayPadding = {x:0, y:0};
            this.comboTime.scrollBar = "DefaultScrollBar";
            this.comboTime.inspectableThumbOffset = {top:0, bottom:0};
            this.comboTime.visible = true;
            try
            {
                this.comboTime["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_inputPrice_infoPointReg_input_0()
        {
            try
            {
                this.inputPrice["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.inputPrice.defaultText = "";
            this.inputPrice.displayAsPassword = false;
            this.inputPrice.editable = true;
            this.inputPrice.enabled = true;
            this.inputPrice.focusable = true;
            this.inputPrice.maxByte = 0;
            this.inputPrice.maxChars = 0;
            this.inputPrice.OnlyNumber = false;
            this.inputPrice.Restrict = "number";
            this.inputPrice.RestrictAddOn = "";
            this.inputPrice.text = "";
            this.inputPrice.textAlign = "left";
            this.inputPrice.visible = true;
            try
            {
                this.inputPrice["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_inputCount_infoPointReg_input_0()
        {
            try
            {
                this.inputCount["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.inputCount.defaultText = "";
            this.inputCount.displayAsPassword = false;
            this.inputCount.editable = true;
            this.inputCount.enabled = true;
            this.inputCount.focusable = true;
            this.inputCount.maxByte = 0;
            this.inputCount.maxChars = 0;
            this.inputCount.OnlyNumber = false;
            this.inputCount.Restrict = "number";
            this.inputCount.RestrictAddOn = "";
            this.inputCount.text = "";
            this.inputCount.textAlign = "left";
            this.inputCount.visible = true;
            try
            {
                this.inputCount["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnReset_infoPointReg_btn_0()
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
            this.btnReset.focusable = false;
            this.btnReset.groupName = "";
            this.btnReset.label = "";
            this.btnReset.overlayAlign = "none";
            this.btnReset.overlayImg = "";
            this.btnReset.overlayPadding = {x:0, y:0};
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

        function __setProp_btnReg_infoPointReg_btn_0()
        {
            try
            {
                this.btnReg["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnReg.autoRepeat = false;
            this.btnReg.autoSize = "none";
            this.btnReg.enabled = true;
            this.btnReg.focusable = false;
            this.btnReg.groupName = "";
            this.btnReg.label = "";
            this.btnReg.overlayAlign = "none";
            this.btnReg.overlayImg = "";
            this.btnReg.overlayPadding = {x:0, y:0};
            this.btnReg.selected = false;
            this.btnReg.toggle = false;
            this.btnReg.visible = true;
            try
            {
                this.btnReg["componentInspectorSetting"] = false;
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
