package InfinityCooperation_fla
{
    import flash.display.*;
    import flash.text.*;
    import scaleform.clik.controls.*;
    import scaleform.gfx.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var MediumText:TextField;
        public var StageDisp:MovieClip;
        public var SmallText:TextField;
        public var TimeText:TextField;
        public var bgBig:DisplayBigTexttBG;
        public var BigText:TextField;
        public var bgMedium:DisplayMediumTextBG;
        public var bgSmall:DisplaySmallTextBG;
        public var ProgressBar:StatusIndicator;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_ProgressBar_Scene1_();
            return;
        }// end function

        function __setProp_ProgressBar_Scene1_()
        {
            try
            {
                this.ProgressBar["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.ProgressBar.enabled = true;
            this.ProgressBar.maximum = 100;
            this.ProgressBar.minimum = 0;
            this.ProgressBar.value = 0;
            this.ProgressBar.visible = true;
            try
            {
                this.ProgressBar["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function frame1()
        {
            InteractiveObjectEx.setHitTestDisable(this, true);
            return;
        }// end function

    }
}
