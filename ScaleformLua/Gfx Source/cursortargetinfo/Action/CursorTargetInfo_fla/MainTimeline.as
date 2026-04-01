package CursorTargetInfo_fla
{
    import flash.display.*;
    import flash.text.*;
    import scaleform.clik.controls.*;
    import scaleform.gfx.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var bg:MovieClip;
        public var textField:TextField;
        public var bar:StatusIndicator;
        public var labelHP:Label;

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
            InteractiveObjectEx.setHitTestDisable(this.bg, true);
            InteractiveObjectEx.setHitTestDisable(this.textField, true);
            InteractiveObjectEx.setHitTestDisable(this.bar, true);
            return;
        }// end function

    }
}
