package ForceRessurection_fla
{
    import flash.display.*;
    import flash.text.*;
    import scaleform.clik.controls.*;

    dynamic public class MB_progressBar_1 extends MovieClip
    {
        public var tfTimer:TextField;
        public var progressbar:StatusIndicator;

        public function MB_progressBar_1()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_progressbar_MB_progressBar_asset_0();
            return;
        }// end function

        function __setProp_progressbar_MB_progressBar_asset_0()
        {
            try
            {
                this.progressbar["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.progressbar.enabled = true;
            this.progressbar.maximum = 100;
            this.progressbar.minimum = 0;
            this.progressbar.value = 0;
            this.progressbar.visible = true;
            try
            {
                this.progressbar["componentInspectorSetting"] = false;
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
