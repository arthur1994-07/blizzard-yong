package PointShop_fla
{
    import flash.display.*;
    import ran.ui.slot.*;
    import scaleform.clik.controls.*;

    dynamic public class CartList_1 extends MovieClip
    {
        public var btnIcon:Button;
        public var btnPurchase:Button;
        public var labelRanPoint:Label;
        public var slot1:Slot;
        public var slot2:Slot;
        public var slot3:Slot;
        public var slot4:Slot;
        public var slot5:Slot;
        public var slot6:Slot;
        public var slot7:Slot;
        public var slot8:Slot;
        public var slot9:Slot;
        public var slot10:Slot;
        public var slot11:Slot;
        public var slot12:Slot;
        public var slot13:Slot;
        public var slot14:Slot;
        public var slot15:Slot;
        public var slot16:Slot;
        public var slot17:Slot;
        public var slot18:Slot;
        public var slot19:Slot;
        public var slot20:Slot;

        public function CartList_1()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_labelRanPoint_CartList_asset_0();
            this.__setProp_btnPurchase_CartList_asset_0();
            this.__setProp_btnIcon_CartList_asset_0();
            return;
        }// end function

        function __setProp_labelRanPoint_CartList_asset_0()
        {
            try
            {
                this.labelRanPoint["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelRanPoint.autoSize = "none";
            this.labelRanPoint.enabled = true;
            this.labelRanPoint.text = "label";
            this.labelRanPoint.visible = true;
            try
            {
                this.labelRanPoint["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnPurchase_CartList_asset_0()
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

        function __setProp_btnIcon_CartList_asset_0()
        {
            try
            {
                this.btnIcon["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnIcon.autoRepeat = false;
            this.btnIcon.autoSize = "none";
            this.btnIcon.enabled = true;
            this.btnIcon.focusable = false;
            this.btnIcon.groupName = "";
            this.btnIcon.label = "";
            this.btnIcon.overlayAlign = "vertical & horizontal";
            this.btnIcon.overlayImg = "trash_icon";
            this.btnIcon.overlayPadding = {x:0, y:0};
            this.btnIcon.selected = false;
            this.btnIcon.toggle = false;
            this.btnIcon.visible = true;
            try
            {
                this.btnIcon["componentInspectorSetting"] = false;
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
