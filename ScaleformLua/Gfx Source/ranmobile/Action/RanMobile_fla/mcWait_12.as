package RanMobile_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class mcWait_12 extends MovieClip
    {
        public var labelWait:Label;

        public function mcWait_12()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_labelWait_mcWait_Layer1_0();
            return;
        }// end function

        function __setProp_labelWait_mcWait_Layer1_0()
        {
            try
            {
                this.labelWait["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelWait.autoSize = "center";
            this.labelWait.autoSizeEnable = false;
            this.labelWait.enabled = true;
            this.labelWait.text = "";
            this.labelWait.visible = true;
            try
            {
                this.labelWait["componentInspectorSetting"] = false;
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
