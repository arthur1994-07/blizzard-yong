package Vehicle_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class mcBoostInfo_5 extends MovieClip
    {
        public var imgBoost:mcBoostImg;
        public var labelBoost:Label;
        public var labelBoostInfo:Label;

        public function mcBoostInfo_5()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_labelBoost_mcBoostInfo_label_0();
            this.__setProp_labelBoostInfo_mcBoostInfo_label_0();
            return;
        }// end function

        function __setProp_labelBoost_mcBoostInfo_label_0()
        {
            try
            {
                this.labelBoost["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelBoost.autoSize = "left";
            this.labelBoost.enabled = true;
            this.labelBoost.text = "";
            this.labelBoost.visible = true;
            try
            {
                this.labelBoost["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelBoostInfo_mcBoostInfo_label_0()
        {
            try
            {
                this.labelBoostInfo["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelBoostInfo.autoSize = "left";
            this.labelBoostInfo.enabled = true;
            this.labelBoostInfo.text = "";
            this.labelBoostInfo.visible = true;
            try
            {
                this.labelBoostInfo["componentInspectorSetting"] = false;
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
