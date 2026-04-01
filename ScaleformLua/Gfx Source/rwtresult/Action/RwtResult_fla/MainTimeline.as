package RwtResult_fla
{
    import flash.display.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var rwt_DrawL:MovieClip;
        public var rwt_DrawR:MovieClip;
        public var rwt_WinL:MovieClip;
        public var rwt_WinR:MovieClip;
        public var rwt_LoseL:MovieClip;
        public var rwt_LoseR:MovieClip;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            return;
        }// end function

        public function LeftTeamWin(param1:String, param2:String, param3:String, param4:String) : void
        {
            this.rwt_DrawL.visible = false;
            this.rwt_WinL.visible = true;
            this.rwt_LoseL.visible = false;
            this.rwt_WinL.tfClubName.text = param1;
            this.rwt_WinL.tfClubPoint.text = param2;
            this.rwt_DrawR.visible = false;
            this.rwt_WinR.visible = false;
            this.rwt_LoseR.visible = true;
            this.rwt_LoseR.tfClubName.text = param3;
            this.rwt_LoseR.tfClubPoint.text = param4;
            return;
        }// end function

        public function LeftTeamLose(param1:String, param2:String, param3:String, param4:String) : void
        {
            this.rwt_DrawL.visible = false;
            this.rwt_WinL.visible = false;
            this.rwt_LoseL.visible = true;
            this.rwt_LoseL.tfClubName.text = param1;
            this.rwt_LoseL.tfClubPoint.text = param2;
            this.rwt_DrawR.visible = false;
            this.rwt_WinR.visible = true;
            this.rwt_LoseR.visible = false;
            this.rwt_WinR.tfClubName.text = param3;
            this.rwt_WinR.tfClubPoint.text = param4;
            return;
        }// end function

        public function TeamDraw(param1:String, param2:String, param3:String, param4:String) : void
        {
            this.rwt_DrawL.visible = true;
            this.rwt_WinL.visible = false;
            this.rwt_LoseL.visible = false;
            this.rwt_DrawL.tfClubName.text = param1;
            this.rwt_DrawL.tfClubPoint.text = param2;
            this.rwt_DrawR.visible = true;
            this.rwt_WinR.visible = false;
            this.rwt_LoseR.visible = false;
            this.rwt_DrawR.tfClubName.text = param3;
            this.rwt_DrawR.tfClubPoint.text = param4;
            return;
        }// end function

        function frame1()
        {
            return;
        }// end function

    }
}
