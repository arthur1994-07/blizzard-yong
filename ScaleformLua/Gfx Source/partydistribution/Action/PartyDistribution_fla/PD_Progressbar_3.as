package PartyDistribution_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class PD_Progressbar_3 extends MovieClip
    {
        public var progressbar:StatusIndicator;

        public function PD_Progressbar_3()
        {
            addFrameScript(0, this.frame1, 9, this.frame10, 19, this.frame20);
            this.__setProp_progressbar_PD_Progressbar_progressBar_0();
            return;
        }// end function

        function __setProp_progressbar_PD_Progressbar_progressBar_0()
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

        function frame10()
        {
            stop();
            return;
        }// end function

        function frame20()
        {
            stop();
            return;
        }// end function

    }
}
