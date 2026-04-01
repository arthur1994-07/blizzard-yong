package CostumeStat_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class mcTitle_2 extends MovieClip
    {
        public var labelTitle:Label;
        public var labelValue:Label;

        public function mcTitle_2()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_labelTitle_mcTitle_Layer1_0();
            this.__setProp_labelValue_mcTitle_Layer1_0();
            return;
        }// end function

        function __setProp_labelTitle_mcTitle_Layer1_0()
        {
            try
            {
                this.labelTitle["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelTitle.autoSize = "left";
            this.labelTitle.autoSizeEnable = false;
            this.labelTitle.enabled = true;
            this.labelTitle.text = "";
            this.labelTitle.visible = true;
            try
            {
                this.labelTitle["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelValue_mcTitle_Layer1_0()
        {
            try
            {
                this.labelValue["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelValue.autoSize = "right";
            this.labelValue.autoSizeEnable = false;
            this.labelValue.enabled = true;
            this.labelValue.text = "";
            this.labelValue.visible = true;
            try
            {
                this.labelValue["componentInspectorSetting"] = false;
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
