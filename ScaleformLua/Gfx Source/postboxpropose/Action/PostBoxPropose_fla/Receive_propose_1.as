package PostBoxPropose_fla
{
    import flash.display.*;
    import flash.text.*;
    import scaleform.clik.controls.*;

    dynamic public class Receive_propose_1 extends MovieClip
    {
        public var ProInfo2:TextField;
        public var sendPlayer:Label;
        public var from:Label;
        public var TitleSendProContents2:Label;
        public var ProContents2:TextArea;
        public var PostDesign2:MovieClip;
        public var OkButton:Button;
        public var NoButton:Button;

        public function Receive_propose_1()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_sendPlayer_Receive_propose_text_0();
            this.__setProp_ProContents2_Receive_propose_text_0();
            return;
        }// end function

        function __setProp_sendPlayer_Receive_propose_text_0()
        {
            try
            {
                this.sendPlayer["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.sendPlayer.autoSize = "right";
            this.sendPlayer.autoSizeEnable = false;
            this.sendPlayer.enabled = true;
            this.sendPlayer.text = "";
            this.sendPlayer.visible = true;
            try
            {
                this.sendPlayer["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_ProContents2_Receive_propose_text_0()
        {
            try
            {
                this.ProContents2["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.ProContents2.defaultText = "";
            this.ProContents2.displayAsPassword = false;
            this.ProContents2.editable = false;
            this.ProContents2.enabled = true;
            this.ProContents2.focusable = false;
            this.ProContents2.maxByte = 0;
            this.ProContents2.maxChars = 0;
            this.ProContents2.minThumbSize = 1;
            this.ProContents2.OnlyNumber = false;
            this.ProContents2.Restrict = "all";
            this.ProContents2.RestrictAddOn = "";
            this.ProContents2.scrollBar = "";
            this.ProContents2.text = "";
            this.ProContents2.textAlign = "left";
            this.ProContents2.thumbOffset = {top:0, bottom:0};
            this.ProContents2.visible = true;
            try
            {
                this.ProContents2["componentInspectorSetting"] = false;
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
