package 
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class LeftTimeItem extends MovieClip
    {
        public var labelName:Label;
        public var labelLeftTime:Label;

        public function LeftTimeItem()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_labelName_LeftTimeItem_Layer1_0();
            this.__setProp_labelLeftTime_LeftTimeItem_Layer1_0();
            return;
        }// end function

        function __setProp_labelName_LeftTimeItem_Layer1_0()
        {
            try
            {
                this.labelName["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelName.autoSize = "center";
            this.labelName.autoSizeEnable = false;
            this.labelName.enabled = true;
            this.labelName.text = "";
            this.labelName.visible = true;
            try
            {
                this.labelName["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelLeftTime_LeftTimeItem_Layer1_0()
        {
            try
            {
                this.labelLeftTime["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelLeftTime.autoSize = "center";
            this.labelLeftTime.autoSizeEnable = false;
            this.labelLeftTime.enabled = true;
            this.labelLeftTime.text = "";
            this.labelLeftTime.visible = true;
            try
            {
                this.labelLeftTime["componentInspectorSetting"] = false;
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
