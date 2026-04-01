package LargeMap_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class mcPosition_1 extends MovieClip
    {
        public var labelPosition:Label;

        public function mcPosition_1()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_labelPosition_mcPosition_asset_0();
            return;
        }// end function

        function __setProp_labelPosition_mcPosition_asset_0()
        {
            try
            {
                this.labelPosition["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelPosition.autoSize = "right";
            this.labelPosition.enabled = true;
            this.labelPosition.text = "";
            this.labelPosition.visible = true;
            try
            {
                this.labelPosition["componentInspectorSetting"] = false;
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
