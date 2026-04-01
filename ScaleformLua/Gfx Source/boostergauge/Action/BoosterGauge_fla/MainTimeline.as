package BoosterGauge_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var mcEffect:MovieClip;
        public var bar:StatusIndicator;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_bar_Scene1_bar_0();
            return;
        }// end function

        function __setProp_bar_Scene1_bar_0()
        {
            try
            {
                this.bar["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.bar.enabled = true;
            this.bar.maximum = 100;
            this.bar.minimum = 0;
            this.bar.value = 0;
            this.bar.visible = true;
            try
            {
                this.bar["componentInspectorSetting"] = false;
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
