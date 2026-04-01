package 
{
    import ran.ui.core.*;
    import scaleform.gfx.*;

    dynamic public class DamageDisplay extends MDamageDisplay
    {

        public function DamageDisplay()
        {
            addFrameScript(0, this.frame1, 14, this.frame15);
            return;
        }// end function

        function frame1()
        {
            InteractiveObjectEx.setHitTestDisable(this, true);
            return;
        }// end function

        function frame15()
        {
            stop();
            return;
        }// end function

    }
}
