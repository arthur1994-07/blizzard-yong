package RwtDashboard_fla
{
    import flash.display.*;
    import flash.text.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var rwt2017Logo:rwtlogo2017;
        public var rwtLogo:rwtlogo;
        public var rwtAName:TextField;
        public var rwtBName:TextField;
        public var rwtAScore:TextField;
        public var rwtBScore:TextField;
        public var rwtTimer:TextField;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            return;
        }// end function

        public function SetTeamA(param1:String, param2:String) : void
        {
            this.rwtAName.text = param1;
            this.rwtAScore.text = param2;
            return;
        }// end function

        public function SetTeamB(param1:String, param2:String) : void
        {
            this.rwtBName.text = param1;
            this.rwtBScore.text = param2;
            return;
        }// end function

        public function SetLeftTime(param1:String) : void
        {
            this.rwtTimer.text = param1;
            return;
        }// end function

        function frame1()
        {
            return;
        }// end function

    }
}
