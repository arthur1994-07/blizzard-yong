package QBox_fla
{
    import flash.display.*;
    import scaleform.gfx.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var mcQBoxText:MovieClip;
        public var mcQBoxTextOnce:MovieClip;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            return;
        }// end function

        function frame1()
        {
            InteractiveObjectEx.setHitTestDisable(this.mcQBoxText, true);
            InteractiveObjectEx.setHitTestDisable(this.mcQBoxTextOnce, true);
            return;
        }// end function

    }
}
