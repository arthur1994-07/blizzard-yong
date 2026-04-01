package RwtClubInfoWindow_fla
{
    import flash.display.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var BClubInfo:MovieClip;
        public var AClubInfo:MovieClip;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            return;
        }// end function

        public function SetClubAText(param1:String, param2:String, param3:String, param4:String, param5:String) : void
        {
            this.AClubInfo.rwtAName.text = param1;
            this.AClubInfo.labelrwtCharName.text = param2;
            this.AClubInfo.labelrwtLv.text = param3;
            this.AClubInfo.labelrwtKill.text = param4;
            this.AClubInfo.labelrwtDeath.text = param5;
            return;
        }// end function

        public function SetClubBText(param1:String, param2:String, param3:String, param4:String, param5:String) : void
        {
            this.BClubInfo.rwtAName.text = param1;
            this.BClubInfo.labelrwtCharName.text = param2;
            this.BClubInfo.labelrwtLv.text = param3;
            this.BClubInfo.labelrwtKill.text = param4;
            this.BClubInfo.labelrwtDeath.text = param5;
            return;
        }// end function

        function frame1()
        {
            return;
        }// end function

    }
}
