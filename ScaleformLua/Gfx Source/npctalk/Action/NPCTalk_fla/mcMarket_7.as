package NPCTalk_fla
{
    import flash.display.*;
    import ran.ui.slot.*;
    import scaleform.clik.controls.*;

    dynamic public class mcMarket_7 extends MovieClip
    {
        public var mcRecommend0:MovieClip;
        public var mcRecommend4:MovieClip;
        public var mcRecommend3:MovieClip;
        public var mcRecommend2:MovieClip;
        public var mcRecommend1:MovieClip;
        public var slotMarket0:Slot;
        public var slotMarket1:Slot;
        public var slotMarket2:Slot;
        public var slotMarket3:Slot;
        public var slotMarket4:Slot;
        public var slotMarket5:Slot;
        public var slotMarket6:Slot;
        public var slotMarket7:Slot;
        public var slotMarket8:Slot;
        public var slotMarket9:Slot;
        public var slotMarket10:Slot;
        public var slotMarket11:Slot;
        public var slotMarket12:Slot;
        public var slotMarket13:Slot;
        public var slotMarket14:Slot;
        public var slotMarket15:Slot;
        public var slotMarket16:Slot;
        public var slotMarket17:Slot;
        public var slotMarket18:Slot;
        public var slotMarket19:Slot;
        public var slotMarket20:Slot;
        public var slotMarket21:Slot;
        public var slotMarket22:Slot;
        public var slotMarket23:Slot;
        public var slotMarket24:Slot;
        public var slotMarket25:Slot;
        public var slotMarket26:Slot;
        public var slotMarket27:Slot;
        public var slotMarket28:Slot;
        public var slotMarket29:Slot;
        public var slotMarket30:Slot;
        public var slotMarket31:Slot;
        public var slotMarket32:Slot;
        public var slotMarket33:Slot;
        public var slotMarket34:Slot;
        public var slotMarket35:Slot;
        public var slotMarket36:Slot;
        public var slotMarket37:Slot;
        public var slotMarket38:Slot;
        public var slotMarket39:Slot;
        public var slotMarket40:Slot;
        public var slotMarket41:Slot;
        public var slotMarket42:Slot;
        public var slotMarket43:Slot;
        public var slotMarket44:Slot;
        public var slotMarket45:Slot;
        public var slotMarket46:Slot;
        public var slotMarket47:Slot;
        public var slotCart0:Slot;
        public var slotCart1:Slot;
        public var slotCart2:Slot;
        public var slotCart3:Slot;
        public var slotCart4:Slot;
        public var slotCart5:Slot;
        public var slotCart6:Slot;
        public var slotCart7:Slot;
        public var slotCart8:Slot;
        public var slotCart9:Slot;
        public var labelRecommend:Label;
        public var labelCostMoney:Label;
        public var labelCartTotalPrice:Label;
        public var labelHaveMoney:Label;
        public var labelMoney:Label;
        public var checkUsableItem:CheckBox;
        public var checkPurchaseItem:CheckBox;
        public var checkOption1:CheckBox;
        public var checkOption2:CheckBox;
        public var checkUsableItem_text:Label;
        public var checkPurchaseItem_text:Label;
        public var checkOption1_text:Label;
        public var checkOption2_text:Label;
        public var btnEmpty:Button;
        public var btnClose:Button;
        public var btnRepair:Button;
        public var btnPurchase:Button;
        public var bgPrice:MovieClip;

        public function mcMarket_7()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_labelRecommend_mcMarket_Layer4_0();
            this.__setProp_labelMoney_mcMarket_label_0();
            this.__setProp_labelCartTotalPrice_mcMarket_label_0();
            this.__setProp_btnClose_mcMarket_Layer7_0();
            this.__setProp_btnRepair_mcMarket_Layer7_0();
            this.__setProp_btnPurchase_mcMarket_Layer7_0();
            this.__setProp_btnEmpty_mcMarket_Layer7_0();
            return;
        }// end function

        function __setProp_labelRecommend_mcMarket_Layer4_0()
        {
            try
            {
                this.labelRecommend["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelRecommend.autoSize = "center";
            this.labelRecommend.autoSizeEnable = false;
            this.labelRecommend.enabled = true;
            this.labelRecommend.text = "";
            this.labelRecommend.visible = true;
            try
            {
                this.labelRecommend["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelMoney_mcMarket_label_0()
        {
            try
            {
                this.labelMoney["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelMoney.autoSize = "right";
            this.labelMoney.autoSizeEnable = false;
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

        function __setProp_labelCartTotalPrice_mcMarket_label_0()
        {
            try
            {
                this.labelCartTotalPrice["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelCartTotalPrice.autoSize = "right";
            this.labelCartTotalPrice.autoSizeEnable = false;
            this.labelCartTotalPrice.enabled = true;
            this.labelCartTotalPrice.text = "";
            this.labelCartTotalPrice.visible = true;
            try
            {
                this.labelCartTotalPrice["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnClose_mcMarket_Layer7_0()
        {
            try
            {
                this.btnClose["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnClose.autoRepeat = false;
            this.btnClose.autoSize = "none";
            this.btnClose.enabled = true;
            this.btnClose.focusable = false;
            this.btnClose.groupName = "";
            this.btnClose.label = "";
            this.btnClose.overlayAlign = "none";
            this.btnClose.overlayImg = "";
            this.btnClose.overlayPadding = {x:0, y:0};
            this.btnClose.selected = false;
            this.btnClose.toggle = false;
            this.btnClose.visible = true;
            try
            {
                this.btnClose["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnRepair_mcMarket_Layer7_0()
        {
            try
            {
                this.btnRepair["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnRepair.autoRepeat = false;
            this.btnRepair.autoSize = "none";
            this.btnRepair.enabled = true;
            this.btnRepair.focusable = false;
            this.btnRepair.groupName = "";
            this.btnRepair.label = "";
            this.btnRepair.overlayAlign = "none";
            this.btnRepair.overlayImg = "";
            this.btnRepair.overlayPadding = {x:0, y:0};
            this.btnRepair.selected = false;
            this.btnRepair.toggle = false;
            this.btnRepair.visible = true;
            try
            {
                this.btnRepair["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnPurchase_mcMarket_Layer7_0()
        {
            try
            {
                this.btnPurchase["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnPurchase.autoRepeat = false;
            this.btnPurchase.autoSize = "none";
            this.btnPurchase.enabled = true;
            this.btnPurchase.focusable = false;
            this.btnPurchase.groupName = "";
            this.btnPurchase.label = "";
            this.btnPurchase.overlayAlign = "none";
            this.btnPurchase.overlayImg = "";
            this.btnPurchase.overlayPadding = {x:0, y:0};
            this.btnPurchase.selected = false;
            this.btnPurchase.toggle = false;
            this.btnPurchase.visible = true;
            try
            {
                this.btnPurchase["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnEmpty_mcMarket_Layer7_0()
        {
            try
            {
                this.btnEmpty["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnEmpty.autoRepeat = false;
            this.btnEmpty.autoSize = "none";
            this.btnEmpty.enabled = true;
            this.btnEmpty.focusable = true;
            this.btnEmpty.groupName = "";
            this.btnEmpty.label = "";
            this.btnEmpty.overlayAlign = "vertical & horizontal";
            this.btnEmpty.overlayImg = "trash_icon";
            this.btnEmpty.overlayPadding = {x:0, y:0};
            this.btnEmpty.selected = false;
            this.btnEmpty.toggle = false;
            this.btnEmpty.visible = true;
            try
            {
                this.btnEmpty["componentInspectorSetting"] = false;
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
