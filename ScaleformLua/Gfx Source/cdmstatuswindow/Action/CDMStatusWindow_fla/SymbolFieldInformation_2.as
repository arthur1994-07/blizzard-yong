package CDMStatusWindow_fla
{
    import flash.display.*;
    import ran.ui.core.*;
    import scaleform.clik.controls.*;

    dynamic public class SymbolFieldInformation_2 extends MovieClip
    {
        public var labelScore:Label;
        public var labelRank:Label;
        public var labelClubName:Label;
        public var imgClub:MImage;
        public var rtClub:MRenderTexture;

        public function SymbolFieldInformation_2()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_labelScore_SymbolFieldInformation_asset_0();
            return;
        }// end function

        function __setProp_labelScore_SymbolFieldInformation_asset_0()
        {
            try
            {
                this.labelScore["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelScore.autoSize = "right";
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
