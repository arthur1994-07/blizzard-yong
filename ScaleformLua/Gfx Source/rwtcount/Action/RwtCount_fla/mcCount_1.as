package RwtCount_fla
{
    import flash.display.*;
    import flash.external.*;

    dynamic public class mcCount_1 extends MovieClip
    {

        public function mcCount_1()
        {
            addFrameScript(89, this.frame90);
            return;
        }// end function

        function frame90()
        {
            stop();
            ExternalInterface.call("OnCustomEvent", "ClubTornamentCount_EndAnim");
            return;
        }// end function

    }
}
