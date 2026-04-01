package CountryAuthProgress_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var labelTitle:Label;
        public var bar:StatusIndicator;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_labelTitle_Scene1_Layer1_0();
            return;
        }// end function

        function __setProp_labelTitle_Scene1_Layer1_0()
        {
            try
            {
                this.labelTitle["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelTitle.autoSize = "center";
            this.labelTitle.enabled = true;
            this.labelTitle.text = "Progressing Now";
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
