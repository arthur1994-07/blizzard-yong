package 
{
    import scaleform.clik.controls.*;

    dynamic public class DefaultStatusIndicator extends StatusIndicator
    {

        public function DefaultStatusIndicator()
        {
            addFrameScript(0, this.frame1);
            return;
        }// end function

        function frame1()
        {
            stop();
            return;
        }// end function

    }
}
