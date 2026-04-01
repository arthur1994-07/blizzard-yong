package 
{
    import scaleform.clik.controls.*;

    dynamic public class GuidanceProgress extends StatusIndicator
    {

        public function GuidanceProgress()
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
