package CountryProgressInfo_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var labelTitle:Label;
        public var labelScore:Label;
        public var labelTime:Label;
        public var bg:MovieClip;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_labelTitle_Scene1_Layer2_0();
            this.__setProp_labelScore_Scene1_Layer2_0();
            this.__setProp_labelTime_Scene1_Layer2_0();
            return;
        }// end function

        function __setProp_labelTitle_Scene1_Layer2_0()
        {
            try
            {
                this.labelTitle["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelTitle.autoSize = "center";
            this.labelTitle.enabled = true;
            this.labelTitle.text = "";
            this.labelTitle.visible = true;
            try
            {
                this.labelTitle["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelScore_Scene1_Layer2_0()
        {
            try
            {
                this.labelScore["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelScore.autoSize = "center";
            this.labelScore.enabled = true;
            this.labelScore.text = "";
            this.labelScore.visible = true;
            try
            {
                this.labelScore["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelTime_Scene1_Layer2_0()
        {
            try
            {
                this.labelTime["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelTime.autoSize = "center";
            this.labelTime.enabled = true;
            this.labelTime.text = "";
            this.labelTime.visible = true;
            try
            {
                this.labelTime["componentInspectorSetting"] = false;
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
