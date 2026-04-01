package CTFSpurtNotify_fla
{
    import flash.display.*;
    import scaleform.gfx.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var info:MovieClip;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1, 75, this.frame76);
            return;
        }// end function

        function frame1()
        {
            InteractiveObjectEx.setHitTestDisable(this, true);
            return;
        }// end function

        function frame76()
        {
            stop();
            return;
        }// end function

    }
}
