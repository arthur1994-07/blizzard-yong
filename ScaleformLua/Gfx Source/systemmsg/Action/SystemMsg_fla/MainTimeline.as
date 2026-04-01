package SystemMsg_fla
{
    import flash.display.*;
    import flash.text.*;
    import scaleform.gfx.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var bg:DisplaySystemMsgBG;
        public var text:TextField;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            return;
        }// end function

        function frame1()
        {
            InteractiveObjectEx.setHitTestDisable(this.text, true);
            return;
        }// end function

    }
}
