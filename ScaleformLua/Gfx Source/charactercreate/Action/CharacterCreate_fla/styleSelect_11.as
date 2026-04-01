package CharacterCreate_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class styleSelect_11 extends MovieClip
    {
        public var labelFace:Label;
        public var labelHair:Label;
        public var optionFace:OptionStepper;
        public var optionHair:OptionStepper;

        public function styleSelect_11()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_optionFace_styleSelect_asset_0();
            this.__setProp_optionHair_styleSelect_asset_0();
            return;
        }// end function

        function __setProp_optionFace_styleSelect_asset_0()
        {
            try
            {
                this.optionFace["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.optionFace.enabled = true;
            this.optionFace.focusable = false;
            this.optionFace.visible = true;
            try
            {
                this.optionFace["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_optionHair_styleSelect_asset_0()
        {
            try
            {
                this.optionHair["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.optionHair.enabled = true;
            this.optionHair.focusable = false;
            this.optionHair.visible = true;
            try
            {
                this.optionHair["componentInspectorSetting"] = false;
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
