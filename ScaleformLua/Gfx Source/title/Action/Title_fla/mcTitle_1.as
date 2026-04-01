package Title_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class mcTitle_1 extends MovieClip
    {
        public var imgTitle_taiwan:mcTitleImg_taiwan;
        public var imgTitle_default:mcTitleImg;
        public var labelTitle:Label;
        public var labelCopyright:Label;

        public function mcTitle_1()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_labelCopyright_mcTitle_Layer1_0();
            this.__setProp_labelTitle_mcTitle_Layer1_0();
            return;
        }// end function

        function __setProp_labelCopyright_mcTitle_Layer1_0()
        {
            try
            {
                this.labelCopyright["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelCopyright.autoSize = "center";
            this.labelCopyright.autoSizeEnable = true;
            this.labelCopyright.enabled = true;
            this.labelCopyright.text = "";
            this.labelCopyright.visible = true;
            try
            {
                this.labelCopyright["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
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
            this.labelTitle.autoSize = "center";
            this.labelTitle.autoSizeEnable = true;
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

        function frame1()
        {
            return;
        }// end function

    }
}
