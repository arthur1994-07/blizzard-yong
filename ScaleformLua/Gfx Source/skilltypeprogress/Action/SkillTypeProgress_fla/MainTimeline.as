package SkillTypeProgress_fla
{
    import flash.display.*;
    import flash.text.*;
    import scaleform.clik.controls.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var skill_type_countdown:TextField;
        public var progressBar:StatusIndicator;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_progressBar_Scene1_progress_0();
            return;
        }// end function

        function __setProp_progressBar_Scene1_progress_0()
        {
            try
            {
                this.progressBar["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.progressBar.enabled = true;
            this.progressBar.maximum = 100;
            this.progressBar.minimum = 0;
            this.progressBar.value = 0;
            this.progressBar.visible = true;
            try
            {
                this.progressBar["componentInspectorSetting"] = false;
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
