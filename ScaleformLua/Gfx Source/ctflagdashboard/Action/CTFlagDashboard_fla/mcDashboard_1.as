package CTFlagDashboard_fla
{
    import flash.display.*;
    import flash.text.*;
    import scaleform.clik.controls.*;

    dynamic public class mcDashboard_1 extends MovieClip
    {
        public var tfTimer:TextField;
        public var blue:MovieClip;
        public var red:MovieClip;
        public var labelGoalScore:Label;

        public function mcDashboard_1()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_labelGoalScore_mcDashboard_Layer1_0();
            return;
        }// end function

        function __setProp_labelGoalScore_mcDashboard_Layer1_0()
        {
            try
            {
                this.labelGoalScore["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelGoalScore.autoSize = "left";
            this.labelGoalScore.enabled = true;
            this.labelGoalScore.text = "";
            this.labelGoalScore.visible = true;
            try
            {
                this.labelGoalScore["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function frame1()
        {
            return;
        }// end function

    }
}
