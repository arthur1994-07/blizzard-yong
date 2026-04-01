package PostBoxSub_fla
{
    import flash.display.*;
    import flash.text.*;
    import ran.ui.slot.*;
    import scaleform.clik.controls.*;

    dynamic public class readPage_1 extends MovieClip
    {
        public var subject:TextField;
        public var staticDate:Label;
        public var date:Label;
        public var leftTime:Label;
        public var staticFrom:Label;
        public var from:Label;
        public var staticAttachItem:Label;
        public var staticReceiveItem:Label;
        public var staticReceiveNonItem:Label;
        public var staticMoney:Label;
        public var money:Label;
        public var staticMyMoney:Label;
        public var myMoney:Label;
        public var contents:TextArea;
        public var slot:Slot;
        public var moneyType:MovieClip;
        public var takeButton:Button;
        public var returnButton:Button;
        public var deleteButton:Button;
        public var replyButton:Button;
        public var closeButton:Button;
        public var design:MovieClip;

        public function readPage_1()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_money_readPage_text_0();
            this.__setProp_myMoney_readPage_text_0();
            this.__setProp_staticMoney_readPage_text_0();
            this.__setProp_staticMyMoney_readPage_text_0();
            this.__setProp_staticReceiveNonItem_readPage_text_0();
            this.__setProp_staticAttachItem_readPage_text_0();
            this.__setProp_contents_readPage_text_0();
            this.__setProp_takeButton_readPage_button_0();
            this.__setProp_deleteButton_readPage_button_0();
            this.__setProp_returnButton_readPage_button_0();
            this.__setProp_replyButton_readPage_button_0();
            this.__setProp_closeButton_readPage_button_0();
            return;
        }// end function

        function __setProp_money_readPage_text_0()
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

        function __setProp_myMoney_readPage_text_0()
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

        function __setProp_staticMoney_readPage_text_0()
        {
            try
            {
                this.staticMoney["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.staticMoney.autoSize = "right";
            this.staticMoney.enabled = true;
            this.staticMoney.text = "";
            this.staticMoney.visible = true;
            try
            {
                this.staticMoney["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_staticMyMoney_readPage_text_0()
        {
            try
            {
                this.staticMyMoney["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.staticMyMoney.autoSize = "right";
            this.staticMyMoney.enabled = true;
            this.staticMyMoney.text = "";
            this.staticMyMoney.visible = true;
            try
            {
                this.staticMyMoney["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_staticReceiveNonItem_readPage_text_0()
        {
            try
            {
                this.staticReceiveNonItem["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.staticReceiveNonItem.autoSize = "left";
            this.staticReceiveNonItem.enabled = true;
            this.staticReceiveNonItem.text = "";
            this.staticReceiveNonItem.visible = true;
            try
            {
                this.staticReceiveNonItem["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_staticAttachItem_readPage_text_0()
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

        function __setProp_contents_readPage_text_0()
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

        function __setProp_takeButton_readPage_button_0()
        {
            try
            {
                this.takeButton["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.takeButton.autoRepeat = false;
            this.takeButton.autoSize = "none";
            this.takeButton.enabled = true;
            this.takeButton.focusable = false;
            this.takeButton.groupName = "";
            this.takeButton.label = "";
            this.takeButton.overlayAlign = "none";
            this.takeButton.overlayImg = "";
            this.takeButton.overlayPadding = {x:0, y:0};
            this.takeButton.preventAutoSize = true;
            this.takeButton.selected = false;
            this.takeButton.toggle = false;
            this.takeButton.visible = true;
            try
            {
                this.takeButton["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_deleteButton_readPage_button_0()
        {
            try
            {
                this.deleteButton["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.deleteButton.autoRepeat = false;
            this.deleteButton.autoSize = "none";
            this.deleteButton.enabled = true;
            this.deleteButton.focusable = false;
            this.deleteButton.groupName = "";
            this.deleteButton.label = "";
            this.deleteButton.overlayAlign = "none";
            this.deleteButton.overlayImg = "";
            this.deleteButton.overlayPadding = {x:0, y:0};
            this.deleteButton.preventAutoSize = true;
            this.deleteButton.selected = false;
            this.deleteButton.toggle = false;
            this.deleteButton.visible = true;
            try
            {
                this.deleteButton["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_returnButton_readPage_button_0()
        {
            try
            {
                this.returnButton["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.returnButton.autoRepeat = false;
            this.returnButton.autoSize = "none";
            this.returnButton.enabled = true;
            this.returnButton.focusable = false;
            this.returnButton.groupName = "";
            this.returnButton.label = "";
            this.returnButton.overlayAlign = "none";
            this.returnButton.overlayImg = "";
            this.returnButton.overlayPadding = {x:0, y:0};
            this.returnButton.preventAutoSize = true;
            this.returnButton.selected = false;
            this.returnButton.toggle = false;
            this.returnButton.visible = true;
            try
            {
                this.returnButton["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_replyButton_readPage_button_0()
        {
            try
            {
                this.replyButton["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.replyButton.autoRepeat = false;
            this.replyButton.autoSize = "none";
            this.replyButton.enabled = true;
            this.replyButton.focusable = false;
            this.replyButton.groupName = "";
            this.replyButton.label = "";
            this.replyButton.overlayAlign = "none";
            this.replyButton.overlayImg = "";
            this.replyButton.overlayPadding = {x:0, y:0};
            this.replyButton.preventAutoSize = true;
            this.replyButton.selected = false;
            this.replyButton.toggle = false;
            this.replyButton.visible = true;
            try
            {
                this.replyButton["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_closeButton_readPage_button_0()
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
