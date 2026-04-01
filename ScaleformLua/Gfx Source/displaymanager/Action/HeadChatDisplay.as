package 
{
    import flash.display.*;
    import flash.text.*;
    import scaleform.gfx.*;

    dynamic public class HeadChatDisplay extends MovieClip
    {
        public var bg:MovieClip;
        public var textField:TextField;

        public function HeadChatDisplay()
        {
            addFrameScript(0, this.frame1);
            return;
        }// end function

        function frame1()
        {
            InteractiveObjectEx.setHitTestDisable(this, true);
            return;
        }// end function

    }
}
