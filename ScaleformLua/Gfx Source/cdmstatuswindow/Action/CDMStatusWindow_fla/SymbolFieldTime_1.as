package CDMStatusWindow_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class SymbolFieldTime_1 extends MovieClip
    {
        public var labelTimeTitle:Label;
        public var labelTime:Label;

        public function SymbolFieldTime_1()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_labelTimeTitle_SymbolFieldTime_asset_0();
            this.__setProp_labelTime_SymbolFieldTime_asset_0();
            return;
        }// end function

        function __setProp_labelTimeTitle_SymbolFieldTime_asset_0()
        {
            try
            {
                this.labelTimeTitle["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelTimeTitle.autoSize = "center";
            this.labelTimeTitle.enabled = true;
            this.labelTimeTitle.text = "";
            this.labelTimeTitle.visible = true;
            try
            {
                this.labelTimeTitle["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelTime_SymbolFieldTime_asset_0()
        {
            try
            {
                this.labelTime["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelTime.autoSize = "right";
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
