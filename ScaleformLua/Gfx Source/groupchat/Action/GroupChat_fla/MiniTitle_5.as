package GroupChat_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class MiniTitle_5 extends MovieClip
    {
        public var label:Label;

        public function MiniTitle_5()
        {
            addFrameScript(0, this.frame1, 9, this.frame10, 19, this.frame20);
            return;
        }// end function

        function frame1()
        {
            return;
        }// end function

        function frame10()
        {
            stop();
            return;
        }// end function

        function frame20()
        {
            gotoAndPlay("notify");
            return;
        }// end function

    }
}
