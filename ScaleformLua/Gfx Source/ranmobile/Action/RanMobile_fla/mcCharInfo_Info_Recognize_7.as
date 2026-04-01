package RanMobile_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class mcCharInfo_Info_Recognize_7 extends MovieClip
    {
        public var btnRecognize:Button;
        public var tfRecognizeInfo:TextArea;

        public function mcCharInfo_Info_Recognize_7()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_btnRecognize_mcCharInfo_Info_Recognize_asset_0();
            this.__setProp_tfRecognizeInfo_mcCharInfo_Info_Recognize_asset_0();
            return;
        }// end function

        function __setProp_btnRecognize_mcCharInfo_Info_Recognize_asset_0()
        {
            try
            {
                this.btnRecognize["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnRecognize.autoRepeat = false;
            this.btnRecognize.autoSize = "none";
            this.btnRecognize.enabled = true;
            this.btnRecognize.focusable = false;
            this.btnRecognize.groupName = "";
            this.btnRecognize.label = "";
            this.btnRecognize.overlayAlign = "none";
            this.btnRecognize.overlayImg = "";
            this.btnRecognize.overlayPadding = {x:0, y:0};
            this.btnRecognize.selected = false;
            this.btnRecognize.toggle = false;
            this.btnRecognize.visible = true;
            try
            {
                this.btnRecognize["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_tfRecognizeInfo_mcCharInfo_Info_Recognize_asset_0()
        {
            try
            {
                this.tfRecognizeInfo["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.tfRecognizeInfo.defaultText = "";
            this.tfRecognizeInfo.displayAsPassword = false;
            this.tfRecognizeInfo.editable = false;
            this.tfRecognizeInfo.enabled = true;
            this.tfRecognizeInfo.focusable = false;
            this.tfRecognizeInfo.maxByte = 0;
            this.tfRecognizeInfo.maxChars = 0;
            this.tfRecognizeInfo.minThumbSize = 1;
            this.tfRecognizeInfo.OnlyNumber = false;
            this.tfRecognizeInfo.Restrict = "all";
            this.tfRecognizeInfo.RestrictAddOn = "";
            this.tfRecognizeInfo.scrollBar = "DefaultScrollBar";
            this.tfRecognizeInfo.text = "";
            this.tfRecognizeInfo.textAlign = "center";
            this.tfRecognizeInfo.thumbOffset = {top:0, bottom:0};
            this.tfRecognizeInfo.visible = true;
            try
            {
                this.tfRecognizeInfo["componentInspectorSetting"] = false;
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
