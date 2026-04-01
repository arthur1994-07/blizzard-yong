package RwtCount_fla
{
    import flash.display.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var mcCount:MovieClip;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            return;
        }// end function

        public function AnimStart() : void
        {
            this.mcCount.gotoAndPlay(0);
            return;
        }// end function

        function frame1()
        {
            return;
        }// end function

    }
}
