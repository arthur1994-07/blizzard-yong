package ProductReset_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var TopText:TextArea;
        public var BottomText:TextArea;
        public var CheckList1:CheckBox;
        public var CheckList2:CheckBox;
        public var CheckList3:CheckBox;
        public var CheckList4:CheckBox;
        public var CheckList1_text:Label;
        public var CheckList2_text:Label;
        public var CheckList3_text:Label;
        public var CheckList4_text:Label;
        public var BtnOK:Button;
        public var BtnNo:Button;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_BtnOK_Scene1_btn_0();
            this.__setProp_BtnNo_Scene1_btn_0();
            this.__setProp_TopText_Scene1_btn_0();
            this.__setProp_BottomText_Scene1_btn_0();
            return;
        }// end function

        function __setProp_BtnOK_Scene1_btn_0()
        {
            try
            {
                this.BtnOK["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.BtnOK.autoRepeat = false;
            this.BtnOK.autoSize = "none";
            this.BtnOK.enabled = true;
            this.BtnOK.focusable = false;
            this.BtnOK.groupName = "";
            this.BtnOK.label = "";
            this.BtnOK.overlayAlign = "none";
            this.BtnOK.overlayImg = "";
            this.BtnOK.overlayPadding = {x:0, y:0};
            this.BtnOK.preventAutoSize = false;
            this.BtnOK.selected = false;
            this.BtnOK.toggle = false;
            this.BtnOK.visible = true;
            try
            {
                this.BtnOK["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_BtnNo_Scene1_btn_0()
        {
            try
            {
                this.BtnNo["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.BtnNo.autoRepeat = false;
            this.BtnNo.autoSize = "none";
            this.BtnNo.enabled = true;
            this.BtnNo.focusable = false;
            this.BtnNo.groupName = "";
            this.BtnNo.label = "";
            this.BtnNo.overlayAlign = "none";
            this.BtnNo.overlayImg = "";
            this.BtnNo.overlayPadding = {x:0, y:0};
            this.BtnNo.preventAutoSize = false;
            this.BtnNo.selected = false;
            this.BtnNo.toggle = false;
            this.BtnNo.visible = true;
            try
            {
                this.BtnNo["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_TopText_Scene1_btn_0()
        {
            try
            {
                this.TopText["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.TopText.defaultText = "";
            this.TopText.displayAsPassword = false;
            this.TopText.editable = false;
            this.TopText.enabled = true;
            this.TopText.focusable = false;
            this.TopText.maxByte = 0;
            this.TopText.maxChars = 0;
            this.TopText.minThumbSize = 1;
            this.TopText.OnlyNumber = false;
            this.TopText.scrollBar = "";
            this.TopText.text = "";
            this.TopText.thumbOffset = {top:0, bottom:0};
            this.TopText.visible = true;
            try
            {
                this.TopText["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_BottomText_Scene1_btn_0()
        {
            try
            {
                this.BottomText["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.BottomText.defaultText = "";
            this.BottomText.displayAsPassword = false;
            this.BottomText.editable = false;
            this.BottomText.enabled = true;
            this.BottomText.focusable = false;
            this.BottomText.maxByte = 0;
            this.BottomText.maxChars = 0;
            this.BottomText.minThumbSize = 1;
            this.BottomText.OnlyNumber = false;
            this.BottomText.scrollBar = "";
            this.BottomText.text = "";
            this.BottomText.thumbOffset = {top:0, bottom:0};
            this.BottomText.visible = true;
            try
            {
                this.BottomText["componentInspectorSetting"] = false;
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
