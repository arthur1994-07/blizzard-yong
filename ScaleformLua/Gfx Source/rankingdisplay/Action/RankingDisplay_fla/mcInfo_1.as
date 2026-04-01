package RankingDisplay_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class mcInfo_1 extends MovieClip
    {
        public var labelRank:Label;
        public var labelName:Label;
        public var labelScore:Label;

        public function mcInfo_1()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_labelRank_mcInfo_Layer1_0();
            this.__setProp_labelName_mcInfo_Layer1_0();
            this.__setProp_labelScore_mcInfo_Layer1_0();
            return;
        }// end function

        function __setProp_labelRank_mcInfo_Layer1_0()
        {
            try
            {
                this.labelRank["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelRank.autoSize = "center";
            this.labelRank.enabled = true;
            this.labelRank.text = "";
            this.labelRank.visible = true;
            try
            {
                this.labelRank["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelName_mcInfo_Layer1_0()
        {
            try
            {
                this.labelName["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelName.autoSize = "center";
            this.labelName.enabled = true;
            this.labelName.text = "";
            this.labelName.visible = true;
            try
            {
                this.labelName["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelScore_mcInfo_Layer1_0()
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

        function frame1()
        {
            return;
        }// end function

    }
}
