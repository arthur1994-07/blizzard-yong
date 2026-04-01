package PostBoxSub_fla
{
    import flash.display.*;
    import flash.text.*;
    import ran.ui.slot.*;
    import scaleform.clik.controls.*;

    dynamic public class previewPage_6 extends MovieClip
    {
        public var subject:TextField;
        public var staticDate:Label;
        public var date:Label;
        public var staticFrom:Label;
        public var from:Label;
        public var staticAttachItem:Label;
        public var staticReceiveItem:Label;
        public var staticReceiveNonItem:Label;
        public var staticMoney:Label;
        public var money:Label;
        public var staticMyMoney:Label;
        public var myMoney:Label;
        public var closeButton:Button;
        public var contents:TextArea;
        public var slot:Slot;
        public var moneyType:MovieClip;
        public var design:MovieClip;

        public function previewPage_6()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_money_previewPage_text_0();
            this.__setProp_myMoney_previewPage_text_0();
            this.__setProp_staticAttachItem_previewPage_text_0();
            this.__setProp_contents_previewPage_text_0();
            this.__setProp_closeButton_previewPage_button_0();
            return;
        }// end function

        function __setProp_money_previewPage_text_0()
        {
            try
            {
                this.money["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.money.autoSize = "right";
            this.money.enabled = true;
            this.money.text = "";
            this.money.visible = true;
            try
            {
                this.money["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_myMoney_previewPage_text_0()
        {
            try
            {
                this.myMoney["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.myMoney.autoSize = "right";
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

        function __setProp_staticAttachItem_previewPage_text_0()
        {
            try
            {
                this.staticAttachItem["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.staticAttachItem.autoSize = "center";
            this.staticAttachItem.enabled = true;
            this.staticAttachItem.text = "";
            this.staticAttachItem.visible = true;
            try
            {
                this.staticAttachItem["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_contents_previewPage_text_0()
        {
            try
            {
                this.contents["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.contents.defaultText = "";
            this.contents.displayAsPassword = false;
            this.contents.editable = false;
            this.contents.enabled = true;
            this.contents.focusable = false;
            this.contents.maxByte = 0;
            this.contents.maxChars = 10;
            this.contents.minThumbSize = 1;
            this.contents.OnlyNumber = false;
            this.contents.scrollBar = "";
            this.contents.text = "";
            this.contents.thumbOffset = {top:0, bottom:0};
            this.contents.visible = true;
            try
            {
                this.contents["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_closeButton_previewPage_button_0()
        {
            try
            {
                this.closeButton["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.closeButton.autoRepeat = false;
            this.closeButton.autoSize = "none";
            this.closeButton.enabled = true;
            this.closeButton.focusable = false;
            this.closeButton.groupName = "";
            this.closeButton.label = "";
            this.closeButton.overlayAlign = "none";
            this.closeButton.overlayImg = "";
            this.closeButton.overlayPadding = {x:0, y:0};
            this.closeButton.preventAutoSize = true;
            this.closeButton.selected = false;
            this.closeButton.toggle = false;
            this.closeButton.visible = true;
            try
            {
                this.closeButton["componentInspectorSetting"] = false;
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
