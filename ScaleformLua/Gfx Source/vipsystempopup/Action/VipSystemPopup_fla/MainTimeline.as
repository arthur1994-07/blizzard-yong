package VipSystemPopup_fla
{
    import flash.display.*;
    import flash.text.*;
    import scaleform.clik.controls.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var tfItemInfo1:TextField;
        public var tfItemInfoBox:TextArea;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_tfItemInfoBox_Scene1_tf_0();
            return;
        }// end function

        function __setProp_tfItemInfoBox_Scene1_tf_0()
        {
            try
            {
                this.tfItemInfoBox["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.tfItemInfoBox.defaultText = "";
            this.tfItemInfoBox.displayAsPassword = false;
            this.tfItemInfoBox.editable = false;
            this.tfItemInfoBox.enabled = true;
            this.tfItemInfoBox.focusable = false;
            this.tfItemInfoBox.maxByte = 0;
            this.tfItemInfoBox.maxChars = 0;
            this.tfItemInfoBox.minThumbSize = 1;
            this.tfItemInfoBox.OnlyNumber = false;
            this.tfItemInfoBox.scrollBar = "";
            this.tfItemInfoBox.text = "";
            this.tfItemInfoBox.thumbOffset = {top:0, bottom:0};
            this.tfItemInfoBox.visible = true;
            try
            {
                this.tfItemInfoBox["componentInspectorSetting"] = false;
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
