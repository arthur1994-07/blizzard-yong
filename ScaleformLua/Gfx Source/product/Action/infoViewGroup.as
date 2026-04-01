package 
{
    import ran.ui.slot.*;
    import scaleform.clik.controls.*;
    import scaleform.clik.core.*;

    dynamic public class infoViewGroup extends UIComponent
    {
        public var HelpBtn:Button;
        public var NeedMaterialTextBox:Label;
        public var ProductGoodsMiddleTextBox:Label;
        public var ProductCountTextBox:Label;
        public var CostSumTextBox:Label;
        public var MoneyTextBox:Label;
        public var ProductCountEdit:TextInput;
        public var MaterialSlot1:Slot;
        public var MaterialSlot2:Slot;
        public var MaterialSlot3:Slot;
        public var MaterialSlot4:Slot;
        public var MaterialSlot5:Slot;
        public var iconMoney:UIComponent;

        public function infoViewGroup()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_ProductCountEdit_infoViewGroup_Edit_0();
            this.__setProp_NeedMaterialTextBox_infoViewGroup_Text_0();
            this.__setProp_ProductGoodsMiddleTextBox_infoViewGroup_Text_0();
            this.__setProp_CostSumTextBox_infoViewGroup_Text_0();
            this.__setProp_MoneyTextBox_infoViewGroup_Text_0();
            return;
        }// end function

        function __setProp_ProductCountEdit_infoViewGroup_Edit_0()
        {
            try
            {
                this.ProductCountEdit["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.ProductCountEdit.defaultText = "";
            this.ProductCountEdit.displayAsPassword = false;
            this.ProductCountEdit.editable = true;
            this.ProductCountEdit.enabled = true;
            this.ProductCountEdit.focusable = true;
            this.ProductCountEdit.maxByte = 3;
            this.ProductCountEdit.maxChars = 0;
            this.ProductCountEdit.OnlyNumber = true;
            this.ProductCountEdit.Restrict = "number";
            this.ProductCountEdit.RestrictAddOn = "";
            this.ProductCountEdit.text = "";
            this.ProductCountEdit.visible = true;
            try
            {
                this.ProductCountEdit["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_NeedMaterialTextBox_infoViewGroup_Text_0()
        {
            try
            {
                this.NeedMaterialTextBox["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.NeedMaterialTextBox.autoSize = "left";
            this.NeedMaterialTextBox.autoSizeEnable = false;
            this.NeedMaterialTextBox.enabled = true;
            this.NeedMaterialTextBox.text = "";
            this.NeedMaterialTextBox.visible = true;
            try
            {
                this.NeedMaterialTextBox["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_ProductGoodsMiddleTextBox_infoViewGroup_Text_0()
        {
            try
            {
                this.ProductGoodsMiddleTextBox["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.ProductGoodsMiddleTextBox.autoSize = "left";
            this.ProductGoodsMiddleTextBox.autoSizeEnable = false;
            this.ProductGoodsMiddleTextBox.enabled = true;
            this.ProductGoodsMiddleTextBox.text = "";
            this.ProductGoodsMiddleTextBox.visible = true;
            try
            {
                this.ProductGoodsMiddleTextBox["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_CostSumTextBox_infoViewGroup_Text_0()
        {
            try
            {
                this.CostSumTextBox["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.CostSumTextBox.autoSize = "left";
            this.CostSumTextBox.autoSizeEnable = false;
            this.CostSumTextBox.enabled = true;
            this.CostSumTextBox.text = "";
            this.CostSumTextBox.visible = true;
            try
            {
                this.CostSumTextBox["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_MoneyTextBox_infoViewGroup_Text_0()
        {
            try
            {
                this.MoneyTextBox["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.MoneyTextBox.autoSize = "left";
            this.MoneyTextBox.autoSizeEnable = false;
            this.MoneyTextBox.enabled = true;
            this.MoneyTextBox.text = "";
            this.MoneyTextBox.visible = true;
            try
            {
                this.MoneyTextBox["componentInspectorSetting"] = false;
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
