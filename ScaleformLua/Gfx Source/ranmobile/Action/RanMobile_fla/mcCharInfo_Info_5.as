package RanMobile_fla
{
    import flash.display.*;
    import flash.text.*;
    import scaleform.clik.controls.*;
    import scaleform.gfx.*;

    dynamic public class mcCharInfo_Info_5 extends MovieClip
    {
        public var recognize:MovieClip;
        public var info:MovieClip;
        public var tfInfo:TextField;
        public var btnSend:Button;
        public var btnReceive:Button;

        public function mcCharInfo_Info_5()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_btnSend_mcCharInfo_Info_Layer3_0();
            this.__setProp_btnReceive_mcCharInfo_Info_Layer3_0();
            return;
        }// end function

        function __setProp_btnSend_mcCharInfo_Info_Layer3_0()
        {
            try
            {
                this.btnSend["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnSend.autoRepeat = false;
            this.btnSend.autoSize = "none";
            this.btnSend.enabled = true;
            this.btnSend.focusable = false;
            this.btnSend.groupName = "";
            this.btnSend.label = "";
            this.btnSend.overlayAlign = "none";
            this.btnSend.overlayImg = "";
            this.btnSend.overlayPadding = {x:0, y:0};
            this.btnSend.selected = false;
            this.btnSend.toggle = false;
            this.btnSend.visible = true;
            try
            {
                this.btnSend["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnReceive_mcCharInfo_Info_Layer3_0()
        {
            try
            {
                this.btnReceive["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnReceive.autoRepeat = false;
            this.btnReceive.autoSize = "none";
            this.btnReceive.enabled = true;
            this.btnReceive.focusable = false;
            this.btnReceive.groupName = "";
            this.btnReceive.label = "";
            this.btnReceive.overlayAlign = "none";
            this.btnReceive.overlayImg = "";
            this.btnReceive.overlayPadding = {x:0, y:0};
            this.btnReceive.selected = false;
            this.btnReceive.toggle = false;
            this.btnReceive.visible = true;
            try
            {
                this.btnReceive["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function frame1()
        {
            TextFieldEx.setVerticalAlign(this.tfInfo, TextFieldEx.VALIGN_CENTER);
            return;
        }// end function

    }
}
