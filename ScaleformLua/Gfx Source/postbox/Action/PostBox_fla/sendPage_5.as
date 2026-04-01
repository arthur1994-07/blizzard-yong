package PostBox_fla
{
    import flash.display.*;
    import ran.ui.slot.*;
    import scaleform.clik.controls.*;
    import scaleform.clik.core.*;

    dynamic public class sendPage_5 extends MovieClip
    {
        public var previewButton:Button;
        public var sendButton:Button;
        public var find:Button;
        public var staticSendTo:Label;
        public var staticSendDesign:Label;
        public var staticSendSubject:Label;
        public var staticSendContents:Label;
        public var bytes:Label;
        public var staticSendMoney:Label;
        public var staticSendBilling:Label;
        public var staticMyMoney:Label;
        public var myMoney:Label;
        public var staticSendNonItem:Label;
        public var purchase:Label;
        public var sendDesign:DropdownMenu;
        public var sendTo:TextInput;
        public var sendSubject:TextInput;
        public var sendMoney:TextInput;
        public var sendBilling:TextInput;
        public var sendContents:TextArea;
        public var itemSlot:Slot;
        public var staticSendBillingImage:UIComponent;
        public var staticSendMoneyimage:UIComponent;
        public var design:MovieClip;

        public function sendPage_5()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_sendMoney_sendPage_edit_0();
            this.__setProp_sendBilling_sendPage_edit_0();
            this.__setProp_sendDesign_sendPage_combo_0();
            this.__setProp_find_sendPage_combo_0();
            this.__setProp_staticSendTo_sendPage_text_0();
            this.__setProp_staticSendDesign_sendPage_text_0();
            this.__setProp_staticSendSubject_sendPage_text_0();
            this.__setProp_staticSendContents_sendPage_text_0();
            this.__setProp_staticSendNonItem_sendPage_text_0();
            this.__setProp_myMoney_sendPage_text_0();
            this.__setProp_bytes_sendPage_text_0();
            this.__setProp_purchase_sendPage_text_0();
            return;
        }// end function

        function __setProp_sendMoney_sendPage_edit_0()
        {
            try
            {
                this.sendMoney["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.sendMoney.defaultText = "";
            this.sendMoney.displayAsPassword = false;
            this.sendMoney.editable = true;
            this.sendMoney.enabled = true;
            this.sendMoney.focusable = true;
            this.sendMoney.maxByte = 0;
            this.sendMoney.maxChars = 0;
            this.sendMoney.OnlyNumber = true;
            this.sendMoney.Restrict = "number";
            this.sendMoney.RestrictAddOn = "";
            this.sendMoney.text = "";
            this.sendMoney.textAlign = "left";
            this.sendMoney.visible = true;
            try
            {
                this.sendMoney["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_sendBilling_sendPage_edit_0()
        {
            try
            {
                this.sendBilling["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.sendBilling.defaultText = "";
            this.sendBilling.displayAsPassword = false;
            this.sendBilling.editable = true;
            this.sendBilling.enabled = true;
            this.sendBilling.focusable = true;
            this.sendBilling.maxByte = 0;
            this.sendBilling.maxChars = 0;
            this.sendBilling.OnlyNumber = true;
            this.sendBilling.Restrict = "number";
            this.sendBilling.RestrictAddOn = "";
            this.sendBilling.text = "";
            this.sendBilling.textAlign = "left";
            this.sendBilling.visible = true;
            try
            {
                this.sendBilling["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_sendDesign_sendPage_combo_0()
        {
            try
            {
                this.sendDesign["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.sendDesign.autoSize = "none";
            this.sendDesign.dropdown = "DefaultScrollingList";
            this.sendDesign.enabled = true;
            this.sendDesign.focusable = false;
            this.sendDesign.groupName = "";
            this.sendDesign.itemRenderer = "DefaultListItemRenderer";
            this.sendDesign.menuDirection = "down";
            this.sendDesign.menuMargin = 1;
            this.sendDesign.inspectableMenuOffset = {top:0, right:0, bottom:0, left:0};
            this.sendDesign.inspectableMenuPadding = {top:0, right:0, bottom:0, left:0};
            this.sendDesign.menuRowCount = 5;
            this.sendDesign.menuRowsFixed = false;
            this.sendDesign.menuWidth = -1;
            this.sendDesign.menuWrapping = "normal";
            this.sendDesign.overlayAlign = "none";
            this.sendDesign.overlayImg = "";
            this.sendDesign.overlayPadding = {x:0, y:0};
            this.sendDesign.scrollBar = "DefaultScrollBar";
            this.sendDesign.inspectableThumbOffset = {top:0, bottom:0};
            this.sendDesign.visible = true;
            try
            {
                this.sendDesign["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_find_sendPage_combo_0()
        {
            try
            {
                this.find["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.find.autoRepeat = false;
            this.find.autoSize = "none";
            this.find.enabled = true;
            this.find.focusable = false;
            this.find.groupName = "";
            this.find.label = "";
            this.find.overlayAlign = "none";
            this.find.overlayImg = "";
            this.find.overlayPadding = {x:0, y:0};
            this.find.selected = false;
            this.find.toggle = false;
            this.find.visible = true;
            try
            {
                this.find["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_staticSendTo_sendPage_text_0()
        {
            try
            {
                this.staticSendTo["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.staticSendTo.autoSize = "right";
            this.staticSendTo.autoSizeEnable = false;
            this.staticSendTo.enabled = true;
            this.staticSendTo.text = "";
            this.staticSendTo.visible = true;
            try
            {
                this.staticSendTo["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_staticSendDesign_sendPage_text_0()
        {
            try
            {
                this.staticSendDesign["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.staticSendDesign.autoSize = "right";
            this.staticSendDesign.autoSizeEnable = false;
            this.staticSendDesign.enabled = true;
            this.staticSendDesign.text = "";
            this.staticSendDesign.visible = true;
            try
            {
                this.staticSendDesign["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_staticSendSubject_sendPage_text_0()
        {
            try
            {
                this.staticSendSubject["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.staticSendSubject.autoSize = "right";
            this.staticSendSubject.autoSizeEnable = false;
            this.staticSendSubject.enabled = true;
            this.staticSendSubject.text = "";
            this.staticSendSubject.visible = true;
            try
            {
                this.staticSendSubject["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_staticSendContents_sendPage_text_0()
        {
            try
            {
                this.staticSendContents["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.staticSendContents.autoSize = "right";
            this.staticSendContents.autoSizeEnable = false;
            this.staticSendContents.enabled = true;
            this.staticSendContents.text = "";
            this.staticSendContents.visible = true;
            try
            {
                this.staticSendContents["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_staticSendNonItem_sendPage_text_0()
        {
            try
            {
                this.staticSendNonItem["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.staticSendNonItem.autoSize = "center";
            this.staticSendNonItem.autoSizeEnable = false;
            this.staticSendNonItem.enabled = true;
            this.staticSendNonItem.text = "";
            this.staticSendNonItem.visible = true;
            try
            {
                this.staticSendNonItem["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_myMoney_sendPage_text_0()
        {
            try
            {
                this.myMoney["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.myMoney.autoSize = "right";
            this.myMoney.autoSizeEnable = false;
            this.myMoney.enabled = true;
            this.myMoney.text = "";
            this.myMoney.visible = true;
            try
            {
                this.myMoney["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_bytes_sendPage_text_0()
        {
            try
            {
                this.bytes["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.bytes.autoSize = "right";
            this.bytes.autoSizeEnable = false;
            this.bytes.enabled = true;
            this.bytes.text = "";
            this.bytes.visible = true;
            try
            {
                this.bytes["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_purchase_sendPage_text_0()
        {
            try
            {
                this.purchase["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.purchase.autoSize = "right";
            this.purchase.autoSizeEnable = false;
            this.purchase.enabled = true;
            this.purchase.text = "";
            this.purchase.visible = true;
            try
            {
                this.purchase["componentInspectorSetting"] = false;
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
