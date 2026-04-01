package CTFlagDashboard_fla
{
    import flash.display.*;

    dynamic public class ctf_flag_3 extends MovieClip
    {

        public function ctf_flag_3()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 21, this.frame22, 41, this.frame42);
            return;
        }// end function

        function frame1()
        {
            stop();
            return;
        }// end function

        function frame2()
        {
            stop();
            return;
        }// end function

        function frame22()
        {
            gotoAndPlay("UsurpBlueFlag");
            return;
        }// end function

        function frame42()
        {
            gotoAndPlay("UsurpRedFlag");
            return;
        }// end function

    }
}
